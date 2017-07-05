FactoryGirl.define do 
  factory :loan do
    amount "123456"
    trait :invalid do 
      amount nil
    end
  end
end