class BanksController < ApplicationController
  def show
    @bank = Bank.find_by(routing_num: params[:id])
  end
end
