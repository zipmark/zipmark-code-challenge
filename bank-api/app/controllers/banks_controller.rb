class BanksController < ApplicationController
  before_action :set_bank, only: [:show, :update, :destroy]

  # GET /banks
  # GET /banks.json
  def index
    Bank.parse
    @banks = Bank.all

    render json: @banks
  end

  # GET /banks/1
  # GET /banks/1.json
  def show
    render json: @bank
  end

  # POST /banks
  # POST /banks.json
  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      render json: @bank, status: :created, location: @bank
    else
      render json: @bank.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /banks/1
  # PATCH/PUT /banks/1.json
  def update
    @bank = Bank.find(params[:id])

    if @bank.update(bank_params)
      head :no_content
    else
      render json: @bank.errors, status: :unprocessable_entity
    end
  end

  # DELETE /banks/1
  # DELETE /banks/1.json
  def destroy
    @bank.destroy

    head :no_content
  end

  private

  def set_bank
    @bank = Bank.find(params[:id])
  end

  def bank_params
    params.require(:bank).permit(:name, :routing_number, :record_type, :phone_number, :street, :street_2, :city, :state, :zip_code)
  end
end
