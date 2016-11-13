class NotificationsController < ApplicationController
  include SmsTool

  def show
  end

  def create
    @notification = Notification.new( notification_params )

    respond_to do |format|
      if @notification.save
        # SmsTool.send_sms '1234567890', 'Body message', 'The app'
        format.json { render action: 'show', status: :created, location: @notification }
      else
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def notification_params
    params.require( :notification ).permit( :phone, :body, :source_app )
  end
end
