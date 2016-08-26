class BanksController < ApplicationController
  def show
    @bank = Bank.find_by(routing_num: params[:id])
    # render :show
    # render json: @bank
  end
end
