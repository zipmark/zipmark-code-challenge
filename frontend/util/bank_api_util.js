module.exports = {
  getBank (routingNumber, callback) {
    $.ajax({
      url: `banks/${routingNumber}`,
      success (bank) {
        callback(bank);
      }
    });
  }
};
