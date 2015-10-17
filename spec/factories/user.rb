FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email { FactoryGirl.generate :email }
    password '12345678'
    password_confirmation { password }
  end
end
