const React = require('react');

const BankDisplyField = React.createClass({

  render() {
    return (
        <div className="data-field">
          { this.props.label } <span>{ this.props.value }</span>
        </div>
    );
  }
});

module.exports = BankDisplyField;
