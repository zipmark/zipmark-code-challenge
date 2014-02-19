class ClearingHousesController < ApplicationController
  respond_to :json
  def show
    @clearing_house = ClearingHouse.find_by(routing_number: params[:routing_number])
    if @clearing_house
      respond_with ClearingHouseFormatter.format(@clearing_house), status:200
    else
      respond_with error_message: "Clearing house could not be found. Please check your routing number." , status: 404
    end
  end

end


