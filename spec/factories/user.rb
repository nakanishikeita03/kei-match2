FactoryBot.define do

  factory :user do
    id                    {1}
    name                  {"nakanishi"}
    img_name              {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/user.jpg'))}
    self_introduction     {"こんにちは"}
    email                 {|i| "guest#{i}@example.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end