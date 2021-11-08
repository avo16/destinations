class Destination < ApplicationRecord
	has_many :vacations
	validates :city, presence: true, uniqueness: true
	validates :country, presence: true, uniqueness: true
	validates :currency, presence: true, length: { is: 3 }

	def weather
		FetchWeather.call(city)
	end
end
