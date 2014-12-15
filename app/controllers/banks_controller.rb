class BanksController < ApplicationController
  before_action :set_bank

  def show
    respond_with @bank
  end

private
  def set_bank
    @bank = Bank.find_by(routing_number: params[:routing_number])
  end
end
