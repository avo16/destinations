class DestinationsController < ApplicationController
  def index
    @options = {
      'Current' => 'current',
      'Forecast' => 'forecast',
      'Search' => 'search',
      'History' => 'history',
      'Astronomy' => 'astronomy',
      'Timezone' => 'timezone',
      'Sports' => 'sports'
    }
    @destinations = Destination.all
  end

  def get_form
    if params[:weather_type].present?
      @days_option = Hash[(1..10).map { |num| [num, num.to_s] }]
      @yes_no_option = { 'Yes' => 'yes', 'No' => 'no' }
      @weather_type = params[:weather_type]
      respond_to do |format|
        # format.html
        format.js
      end
    end
  end

  def get_data
    if params[:weather_type].present?
      params_requested = get_data_params.to_h
      @weather = WeatherDestination.call(params[:weather_type], params_requested)
      @weather[:type] = params[:weather_type]
      @weather
      respond_to do |format|
        binding.pry
        format.js
      end
    end
  end

  private

  def get_data_params
    params.permit(:api, :days, :date, :city, :alerts).tap { |u| u[:days] = u[:days].to_i }
  end
end
