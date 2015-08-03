class BanksController < ApplicationController
  def show
    @bank = Bank.find_by_routing_number!(params[:id])
  end
end
