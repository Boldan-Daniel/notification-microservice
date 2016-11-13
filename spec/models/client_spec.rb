require 'rails_helper'

RSpec.describe Client, type: :model do
  let(:client) { build_stubbed :client }

  it 'has a valid factory' do
    expect(client).to be_valid
  end

  it 'is not valid with nil source_app' do
    client.source_app = nil
    expect(client).to_not be_valid
  end

  it 'is not valid with nil api_key' do
    client.api_key = nil
    expect(client).to_not be_valid
  end

end
