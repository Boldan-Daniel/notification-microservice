class NotificationsController < ApplicationController
  include SmsTool
  before_action :set_notification, only: [:show]
  before_action :set_client, only: [:create]

  def show
    respond_to do |format|
      format.json { render json: @notification.to_json }
    end
  end

  def create
    if @client
      @notification = @client.notifications.new(notification_params)

      respond_to do |format|
        if @notification.save
          SmsTool.send_sms @notification.phone, @notification.body, @notification.source_app
          format.json { render action: 'show', status: :created, location: @notification }
        else
          format.json { render json: @notification.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.json { render json: {}, status: :unprocessable_entity }
      end
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:phone, :body, :source_app)
  end

  def set_notification
    @notification = Notification.find_by_id params[:id]
  end

  def set_client
    @client = Client.find_by_source_app params[:notification][:source_app]
  end
end
