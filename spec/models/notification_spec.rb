require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'creation' do
    it 'can be created' do
      notification = Notification.new(phone: '233-2211-4466', body: 'Body text', source_app: 'app name')
      expect(notification).to be_valid
    end
  end
end
