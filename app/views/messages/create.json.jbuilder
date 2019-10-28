json.id @message.id
json.image @message.user.img_name.url(:thumb)
json.name @message.user.name
json.date @message.created_at.strftime("%Y/%m/%d %H:%M")
json.content @message.content