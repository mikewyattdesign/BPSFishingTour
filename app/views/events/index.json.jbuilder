json.array!(@events) do |event|
  json.extract! event, :name, :address, :address2, :city, :province, :state, :country, :start_date, :end_date
  json.url event_url(event, format: :json)
end