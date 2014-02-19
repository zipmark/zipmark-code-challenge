class SearchController < ApplicationController
  def new
  end

  def show
    @clearing_house = ClearingHouse.find_by(routing_number: params[:routing_number])
  end
end
