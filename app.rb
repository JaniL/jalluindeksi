require "uri"
require 'rubygems'
require 'json'
require 'rest-client'

get '/' do
  #uri = URI.parse("http://www.alko.fi/api/find/products?Language=fi&Page=0&PageSize=1&ProductIds=000706&SingleGrape=false&Sort=0")
  #http = Net::HTTP.new(uri.host, uri.port)
  #request = Net::HTTP::Get.new(uri.request_uri)

  #response = http.request(request)
  #json = JSON.parse(response.body)
  #{}"Jalluindeksi on tällä hetkellä #{json["Results"][0]["Price"]} euroa."
  erb :index
end

get '/price' do
  uri = "https://acumj9o7uh.execute-api.eu-central-1.amazonaws.com/dev/getJallu"
  res = RestClient.get(uri)
  json = JSON.parse(res.body)
  json["message"] == "Success" ? json["data"]["price"] : json["message"]
end
