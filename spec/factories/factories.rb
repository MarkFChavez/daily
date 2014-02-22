FactoryGirl.define do
  factory :user do
    email 'validuser@daily.com'
    password 'foobar123'
    password_confirmation 'foobar123'
  end

  factory :expense do
    amount 50.00
    description 'transportation'
  end
end
