class BanksController < ApplicationController

  def show
    load_bank_by_route
    format_bank
    send_bank
  end

  private
  def load_bank_by_route
    @bank ||= Bank.find_by(routing_number: params[:routing_number])
  end

  def format_bank
    if @bank
      @bank = @bank.formatted
    else
      @bank = "Bank Not Found/Routing Number Invalid"
    end
  end

  def send_bank(template= :json)
    render template => @bank
  end

end