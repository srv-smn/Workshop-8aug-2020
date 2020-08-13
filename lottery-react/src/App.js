import React ,{Component} from 'react';
import logo from './logo.svg';
import './App.css';
import web3 from './web3';
import lottery from './lottery';

class App extends Component {
  state ={
    manager:'',
    players:[],
    balance: '',
    value:'',
    message:''
  };

  async componentDidMount(){
    const manager = await lottery.methods.manager().call();
    const players = await lottery.methods.getPlayers().call();
    const balance = await web3.eth.getBalance(lottery.options.address)
    this.setState({manager, players, balance});

  }
  render(){
  return (
    <div className="App">
      <h1>Hello world</h1>
      <h1>{this.state.manager}|| {this.state.players}||{this.state.balance}</h1>
    </div>
  );
}
}

export default App;
