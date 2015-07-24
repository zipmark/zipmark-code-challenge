class BankController < ApplicationController
  #GET '/banks/:routing_number'
  def show
    bank = Bank.find_by_routing_number(params[:routing_number])
    if bank 
      return render :json => bank.public_json
    else
      return render :json => {:error => 'Bank not found'}
    end
  end
end
