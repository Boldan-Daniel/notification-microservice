FactoryGirl.define do
  factory :notification do
    phone '2217878255'
    body 'Body text'
    source_app 'app_one'
  end

  factory :other_notification, class: 'Notification' do
    phone '4439999777'
    body 'Other body text'
    source_app 'app_one'
  end

  factory :outside_notification, class: 'Notification' do
    phone '5553338282'
    body 'Another other body text'
    source_app 'app_two'
  end
end
