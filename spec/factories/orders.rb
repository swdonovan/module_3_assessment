FactoryGirl.define do
  factory :order do
    amount [*1...100000].sample
    user user
  end
end
