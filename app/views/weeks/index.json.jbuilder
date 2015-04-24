# app/views/restaurants/index.json.jbuilder

json.array!(@weeks) do |restaurant|
  json.extract! week, :number, :id
  json.url week_url(week, format: :json)
end
