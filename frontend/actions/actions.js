const AppDispatcher = require("../dispatcher/dispatcher");
const Constants = require("../constants/constants");
const BankApiUtil = require("../util/bank_api_util");

const Actions = {

  getBank(routingNumber){
    BankApiUtil.getBank(routingNumber, this.receiveBank);
  },

  receiveBank (bank) {
    AppDispatcher.dispatch({
      actionType: Constants.BANK_RECEIVED,
      bank: bank
    });
  },

};

module.exports = Actions;
