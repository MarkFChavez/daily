FactoryGirl.define do
  factory :user do
    email 'validuser@daily.com'
    password 'foobar123'
    password_confirmation 'foobar123'
  end
end
