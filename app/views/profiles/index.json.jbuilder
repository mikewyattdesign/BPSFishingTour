json.array!(@profiles) do |profile|
  json.extract! profile, :user_id, :first_name, :last_name, :street_address, :suite, :city, :state, :zip, :phone, :ext, :shirt
  json.url profile_url(profile, format: :json)
end