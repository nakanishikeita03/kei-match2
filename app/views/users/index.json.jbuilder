json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.img_name user.img_name.url
end