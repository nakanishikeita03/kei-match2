FactoryBot.define do

  factory :post do
    text                  {"今日はprogateをやりました"}
    user_id               {1}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

end