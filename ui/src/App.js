/*import {
  Navbar,
  Container,
  Button,
  Form,
  FormControl,
  Tabs,
  Tab,
  Row,
  Col,
  Card,
} from "react-bootstrap";*/

import Web3 from "web3";

import "bootstrap/dist/css/bootstrap.min.css";
import { useState } from "react";

import "./App.css";

import Medicine from "./ContractJSON/MedicineContract.json";

function App() {
  


  const ethereum = window.ethereum;

  const web3 = new Web3(ethereum);

  const [walletAddress,setwalletAddress]= useState(null);
  
  const MedicineContractAddress = Medicine.networks["5777"].address;
  const MedicineContractAbi = Medicine.abi;
  const MedicineContract = new web3.eth.Contract(MedicineContractAbi, MedicineContractAddress);




  const enableMetaMask = async () => {
    await ethereum.request({ method: "eth_requestAccounts" });
    console.log(ethereum.selectedAddress);
  };

  const connectWallet = async () => {
    await ethereum.request({ method: "eth_requestAccounts" });
    debugger;
    setwalletAddress(ethereum.selectedAddress)
  };

  const addMedicineInfo = async (medicineId, medicineName, 
    manufacturingCompany,manufacturingPlace ,
    expiryDate ,precautions,
    chemicalComosition) => {
      debugger;
    enableMetaMask();
    const infoValue = await MedicineContract.methods
      .addMedicineInfo(MedicineContractAddress, medicineId, medicineName, 
        manufacturingCompany,manufacturingPlace ,
        expiryDate ,precautions,
        chemicalComosition)
      .send({ from: ethereum.selectedAddress, value: 1000000000000000000 });
    console.log(infoValue);
  };

  return (
    <container><div className="App">
      <div className="text">
        Manufactururing Unit Account: {walletAddress}
        </div>
      <button className="connect-button" onClick={connectWallet}>
        Connect Wallet
      </button>
      
      <form onSubmit={addMedicineInfo}>
        <table>
        
      <tr><td><label>medicine Id: </label></td>
      <td><input type="number"  name="medicineId" /></td></tr>

      <tr><td><label>medicine Name: </label></td>
      <td><input type="text" name="medicineName" /></td></tr>

      <tr><td><label>Manufacturing Company: </label></td>
      <td><input type="text" name="manufacturingCompany" /></td></tr>

      <tr><td><label>Manufacturing Place: </label></td>
      <td><input type="text" name="manufacturingPlace" /></td></tr>

      <tr><td><label>Expiry Date: </label></td>
      <td><input type="number" name="expiryDate" /></td></tr>
      <tr><td><label>Precautions: </label></td><td><input type="text" name="precautions" /></td></tr>
      <tr><td><label>Chemical Composition: </label></td><td><input type="text" name="chemicalComosition" /></td></tr>
      <tr><td><input type="submit" value="Submit" /></td></tr>
      
      </table>
      </form>
      </div>
    
    </container>
  );
}

export default App;
