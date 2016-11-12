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

    it 'is not valid if phone contains other than integers' do
      notification.phone = 'abcdef'
      expect( notification ).not_to be_valid
    end

    it 'is not valid if phone length is greater than 10' do
      notification.phone = '12345678901'
      expect( notification ).not_to be_valid
    end

    it 'is not valid if phone length is less than 10' do
      notification.phone = '123456789'
      expect( notification ).not_to be_valid
    end

    it 'is not valid if body length is greater than 160' do
      notification.body = 'a' * 161
      expect( notification ).not_to be_valid
    end
  end
end
