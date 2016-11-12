FactoryGirl.define do
  factory :notification do
    phone '2217878255'
    body 'Body text'
    source_app 'App name'
  end

  factory :other_notification, class: 'Notification' do
    phone '4439999777'
    body 'Other body text'
    source_app 'Other app name'
  end
end
