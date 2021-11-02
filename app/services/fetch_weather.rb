require 'uri'
require 'net/http'
require 'openssl'

module FetchWeather
	extend self

	def call(city)
		url = build_url(city)
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = false
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(url)
		response = http.request(request)
		
		extract_weather_info(response)
	end

	private

	def build_url(city)
		URI("http://api.weatherapi.com/v1/current.json?key=93317892489f418dbb4190919210111&q=#{city}")
	end

	def extract_weather_info(response)
		body = JSON.parse(response.read_body).deep_symbolize_keys
		body[:current][:feelslike_c]
	end
end