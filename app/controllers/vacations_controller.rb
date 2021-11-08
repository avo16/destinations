class VacationsController < ApplicationController
  def index
    @vacations = Current.user.vacations
  end
end
