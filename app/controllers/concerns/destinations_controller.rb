class DestinationsController < ApplicationController
	def index
		params = { city: 'London'}
		@weather = WeatherDestination.call('current', params)
		@destinations = Destination.all
	end
end
