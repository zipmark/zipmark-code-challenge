require 'test_helper'

class BanksControllerTest < ActionController::TestCase
  setup do
    @bank = banks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create bank" do
    assert_difference('Bank.count') do
      post :create, params: { bank: { address_id: @bank.address_id, name: @bank.name, phone_number: @bank.phone_number, record_type: @bank.record_type, routing_number: @bank.routing_number } }
    end

    assert_response 201
  end

  test "should show bank" do
    get :show, params: { id: @bank }
    assert_response :success
  end

  test "should update bank" do
    patch :update, params: { id: @bank, bank: { address_id: @bank.address_id, name: @bank.name, phone_number: @bank.phone_number, record_type: @bank.record_type, routing_number: @bank.routing_number } }
    assert_response 200
  end

  test "should destroy bank" do
    assert_difference('Bank.count', -1) do
      delete :destroy, params: { id: @bank }
    end

    assert_response 204
  end
end
