const Tx = require('ethereumjs-tx').Transaction
const Web3 = require("web3")
const web3 = new Web3('http://127.0.0.1:7545') 
const account1 = '0xDF5111Ebbf84132Fc84C64D06F3D1B5169Cdd8AB' 
const account2 = '0xa024CE46F90c74B745954319927c99b8C60e958a' 



// create account with web3 
// console.log(web3.eth.accounts.create()) 

const privateKey1 = Buffer.from('79e3f3f77708c2f4ff846e3a984edb1a3f23f294d99ba779ed601ab392aa1c78', 'hex')
const privateKey2 = Buffer.from('f2a36378586332e306e986e0315e3b75958b8d277326353496de23b2390e23bc', 'hex')

// get balance of accounts
web3.eth.getBalance(account1, (err, data) => {
    console.log('Balance of account1 is : ', web3.utils.fromWei(data, 'ether'));
})

web3.eth.getBalance(account2, (err, data) => {
    console.log('Balance of account2 is : ', web3.utils.fromWei(data, 'ether'));
})

// transaction steps 
// 1 - build transaction


var txObject ; 
web3.eth.getTransactionCount(account1, (err, txCount) => {
    txObject = { 
        nounce: web3.utils.toHex(txCount), 
        to: account2, 
        value: web3.utils.toHex(web3.utils.toWei('1', 'ether')), 
        gasLimit: web3.utils.toHex(22222), 
        gasPrice: web3.utils.toHex(web3.utils.toWei('1', 'gwei')), 
    
    }
    console.log(txObject);
})



// 2 - sign the transaction

const tx =new Tx(txObject) ;
tx.sign(privateKey1)
const serializedTransaction = tx.serialize()
// const raw = '0x' + serializedTransaction.toString('hex')

// 3 - Broadcast & publish the Transaction
web3.eth.sendSignedTransaction('0x' + serializedTransaction.toString('hex'), (err, txHash) => {
    console.log(err);
    console.log('Transaction hash is : ', txHash);
})