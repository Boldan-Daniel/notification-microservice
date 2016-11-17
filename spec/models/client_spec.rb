require 'rails_helper'

RSpec.describe Client, type: :model do
  let(:client) { build_stubbed :client }

  describe 'validation' do
    it 'has a valid factory' do
      expect(client).to be_valid
    end

    it 'is not valid with nil source_app' do
      client.source_app = nil
      expect(client).to_not be_valid
    end

    it 'has a unique source_app' do
      client_one = create( :client )
      duplicate_client = client_one.dup
      expect(duplicate_client).to_not be_valid
    end
  end

  describe 'relationship' do
    it 'has a connection to a client based on the source_app attribute' do
      client = Client.create( source_app: 'app_name', api_key: 'tGd9ehMBtCngWPKBlzHROQtt' )
      notification = client.notifications.create!( phone: '1234567890', body: 'body text' )

      expect( notification.source_app ).to eq( 'app_name' )
    end
  end

  describe 'callbacks' do
    it 'will have an api_key automatically assigned when created' do
      client = Client.create( source_app: 'app_name' )
      expect( client.api_key ).to_not be_nil
    end
  end
end
