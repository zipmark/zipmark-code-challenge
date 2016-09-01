const ReactDOM = require('react-dom');
const React = require('react');
const Constants = require("./constants/constants");
const BankDisplay = require("./components/bank_display");
const Actions = require("./actions/actions");
const BankStore = require("./stores/bank_store");


const App = React.createClass({

  getInitialState(){
    return ({ search: "", bank: {} });
  },

  changeSearch(e){
    this.setState({ search: e.target.value });
  },

  componentDidMount(){
    BankStore.addListener(this.updateBank);
  },

  updateBank(){
    this.setState({ bank:BankStore.searchedBank() });
  },

  changeHandler(){
    this.setState({ bank: BankStore.searchedBank() });
  },

  submitSearch(){
    Actions.getBank(this.state.search);
  },

  formattedBank(){
    let bank = <div style={{"fontStyle":"italic"}}>Enter a routing number</div>;
    if (this.state.bank.cust_name){
      bank = <BankDisplay data={this.state.bank}/>;
    } else {
      bank = <div className="error">{this.state.bank.error}</div>;
    }
    return bank;
  },

  render() {
    return (
        <div>
          <div className="search">
            <input type="text" placeholder="routing number" onChange={this.changeSearch}></input>
            <button onClick={this.submitSearch}>Search</button>
          </div>
          {this.formattedBank()}
        </div>
    );
  }
});

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<App />, document.querySelector("#content"));
});
