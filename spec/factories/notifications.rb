FactoryGirl.define do
  factory :notification do
    phone '221-7878-2666'
    body 'Body text'
    source_app 'App name'
  end

  factory :other_notification, class: 'Notification' do
    phone '443-9999-7777'
    body 'Other body text'
    source_app 'Other app name'
  end
end
