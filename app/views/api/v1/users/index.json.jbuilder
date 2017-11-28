json.array! @users do |user|
  json.extract! user, :username, :email, :phone_number
end
