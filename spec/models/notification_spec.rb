require 'rails_helper'

RSpec.describe Notification, type: :model do
  let( :notification ) { build_stubbed( :notification ) }

  describe 'factory main model' do
    it 'is a valid notification' do
      expect(notification).to be_valid
    end
  end

  describe 'validation' do
    it 'is not a valid model with phone nil' do
      notification.phone = nil
      expect( notification ).to_not be_valid
    end

    it 'is not a valid model with body nil' do
      notification.body = nil
      expect( notification ).to_not be_valid
    end

    it 'is not a valid model with source app nil' do
      notification.source_app = nil
      expect( notification ).to_not be_valid
    end
  end
end
