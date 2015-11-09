class BanksController < ApplicationController
  before_action :set_bank, only: [:show, :update]

  def index
    @banks = Bank.all.order('updated_at')

    render json: @banks
  end

  def show
    render json: @bank
  end

  def update
    @bank = Bank.find(params[:routing_number])

    if @bank.update(bank_params)
      head :no_content
    else
      render json: @bank.errors, status: :unprocessable_entity
    end
  end

  def update_fed_data
    FedDataParser.update_fed_data
  end

  private

  def set_bank
    @bank = Bank.find_by(routing_number: params[:routing_number])
  end

  def bank_params
    params.require(:bank).permit(:name, :routing_number, :record_type, :phone_number, :street, :street_2, :city, :state, :zip_code)
  end
end
