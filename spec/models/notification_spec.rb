require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'creation' do
    it 'can be created' do
      notification = create(:notification) # create method it can lead to a slow test suite.
      expect(notification).to be_valid
    end
  end
end
