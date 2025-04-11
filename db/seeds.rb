# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do |i|
  User.find_or_create_by!(
    email: "user#{i + 1}@example.com",
    first_name: "FirstName#{i + 1}",
    last_name: "LastName#{i + 1}"
  )
end


10.times do
  sender = User.pluck(:id).sample
  receiver = (User.pluck(:id) - [sender]).sample 

  Chat.find_or_create_by!(
    sender_id: sender,
    receiver_id: receiver
  )
end

Chat.all.each do |chat|
  5.times do |i|
    Message.find_or_create_by!(
      chat_id: chat.id,
      user_id: [chat.sender_id, chat.receiver_id].sample, 
      body: "Message #{i + 1} in Chat #{chat.id}"
    )
  end
end