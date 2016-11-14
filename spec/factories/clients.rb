FactoryGirl.define do
  factory :client do
    source_app 'app_one'
    api_key 'tGd9ehMBtCngWPKBlzHROQtt'
  end

  factory :other_client, class: 'Client' do
    source_app 'app_two'
    api_key 'I384fHtD1h9XZvs4fGPJUgtt'
  end

end
