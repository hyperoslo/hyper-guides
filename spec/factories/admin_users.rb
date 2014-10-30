FactoryGirl.define do

  factory :admin_user do
    first_name "Admini"
    last_name "Strator"
    sequence(:email) { |n| "admin#{n}@example.com" }
    password "secret-password"
  end

end
