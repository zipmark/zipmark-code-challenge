const React = require('react');

const BankDisplay = React.createClass({

  render() {
    let bank = this.props.data;
    return (
      <div className="bank-box">
        <div className="data-field">
          Bank: <span>{ bank.cust_name }</span>
        </div>
        <div className="data-field">
          Routing Number: <span>{ bank.routing_num }</span>
        </div>
        <div className="data-field">
          Telephone: <span>{ bank.tel_num }</span>
        </div>
        <div className="data-field">
          Address: <span>{ `${bank.address.street_address}` }</span>
        </div>
        <div className="data-field">
          City: <span>{ `${bank.address.city}` }</span>
        </div>
        <div className="data-field">
          State: <span>{ `${bank.address.state}` }</span>
        </div>
        <div className="data-field">
          Zip: <span>{ `${bank.address.zipcode}` }</span>{"    "}Ext: <span>{ ` ${bank.address.zipcode_ext}` }</span>
        </div>
        <div className="data-field">
          Record Type: <span>{ `${bank.record_type}` }</span>
        </div>
        <div className="data-field">
          Record Type Code: <span>{ `${bank.record_type_code}` }</span>
        </div>
        <div className="data-field">
          Servicing FRB Number: <span>{ `${bank.frb_num}` }</span>
        </div>
        <div className="data-field">
          New Routing Number: <span>{ `${bank.new_routing_num}` }</span>
        </div>
        <div className="data-field">
          Data View Code: <span>{ `${bank.data_view_code}` }</span>
        </div>
        <div className="data-field">
          Office Code: <span>{ `${bank.office_code}` }</span>
        </div>
        <div className="data-field">
          Date last changed: <span>{ `${bank.last_change_date}` }</span>
        </div>
      </div>
    );
  }
});

module.exports = BankDisplay;
