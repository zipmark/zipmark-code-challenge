class BanksController < ApplicationController
  def show
    @bank = Bank.find_by(routing_num: params[:id])
    render json: {error: "No bank found with that routing number, try again."} unless @bank
  end
end
