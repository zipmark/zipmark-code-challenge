const Store = require('flux/utils').Store;
const Constants = require('constants/constants.js');
const AppDispatcher = require("dispatcher");
const BankStore = new Store(AppDispatcher);

let _bank = {};

const setBank = function (bank) {
  _bank = bank;
};

BankStore.searchedBank = function () {
  return Object.assign({}, _bank);
};

BankStore.__onDispatch = function (payload) {
  switch (payload.actionType) {
    case Constants.BANK_RECEIVED:
      setBank(payload.bank);
      BankStore.__emitChange();
      break;
  }
};

module.exports = BankStore;
