FactoryBot.define do

  factory :user do
    name                  {"nakanishi"}
    img_name              {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/user.jpg'))}
    self_introduction     {"こんにちは"}
    email                 {|i| "guest#{i}@example.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    created_at            { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

end