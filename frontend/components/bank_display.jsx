const React = require('react');
const BankDisplyField = require('components/bank_display_field');

const BankDisplay = React.createClass({

  bankFields(){
    let bank = this.props.data;
    return {
      "Bank": bank.cust_name,
      "Routing Number": bank.routing_num,
      "Telephone": bank.tel_num,
      "Address": bank.address.street_address,
      "City": bank.address.city,
      "State": bank.address.state,
      "Zip": bank.address.zipcode,
      "Zip-ext": bank.address.zipcode_ext,
      "Record Type": bank.record_type,
      "Record Type Code": bank.record_type_code,
      "Servicing FRB Number": bank.frb_num,
      "New Routing Number": bank.new_routing_num,
      "Data View Code": bank.data_view_code,
      "Office Code": bank.office_code,
      "Date last changed": bank.last_change_date
    };
  },

  fieldComponents(){
    return Object.keys(this.bankFields()).map((field, idx)=>{
      return (
          <BankDisplyField key={ idx } label={ field } value={ this.bankFields()[field] }/>
        );
    });
  },

  render() {
    let bank = this.props.data;
    return (
      <div className="bank-box">
        { this.fieldComponents() }
      </div>
    );
  }
});

module.exports = BankDisplay;
