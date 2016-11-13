require 'rails_helper'

RSpec.describe Notification, type: :request do
  let(:params) do
    { notification: {
        phone: '2233331111',
        body: 'Notification body',
        source_app: 'Notification source appxxx'
    } }
  end

  let(:headers) { {'ACCEPT' => 'application/json' } }
  
  it 'creates a Notificaton' do
    post '/notifications', params: params, headers: headers

    expect( response.content_type ).to eq( 'application/json' )
    expect( response ).to have_http_status( :created )
  end

  it 'renders an error status if the notification was not created' do
    params[:notification].delete :body
    post '/notifications', params: params, headers: headers

    expect( response.content_type ).to eq( 'application/json' )
    expect( response ).to have_http_status( :unprocessable_entity )
  end

  it 'sends sms after notification is created' do
    post '/notifications', params: params, headers: headers

    expect( FakeSms.messages.last.num ).to eq( '2233331111' )
  end
end