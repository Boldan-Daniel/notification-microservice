require 'rails_helper'

RSpec.describe Notification, type: :request do
  it 'creates a Notificaton' do
    headers = {
        'ACCEPT' => 'application/json'
    }

    post '/notifications',
        {
            notification: {
                phone: '222-3333-1111',
                body: 'Notification body',
                source_app: 'Notification source app'
            }
        }, headers

    expect( response.content_type ).to eq( 'application/json' )
    expect( response ).to have_http_status( :created )
  end

  it 'renders an error status if the notification was not created' do
    headers = {
        'ACCEPT' => 'application/json'
    }

    post '/notifications',
         {
             notification: {
                 phone: '222-3333-1111',
                 source_app: 'Notification source app'
             }
         }, headers

    expect( response.content_type ).to eq( 'application/json' )
    expect( response ).to have_http_status( :unprocessable_entity )
  end
end