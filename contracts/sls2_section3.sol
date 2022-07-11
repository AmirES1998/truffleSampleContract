
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^ 0.8.7  ; 

contract nextContract { 

     address public  owner ; 
    constructor() { 
        owner = msg.sender ; 
    }


    event transfer(address _from, address _to , uint _amount) ; 
    mapping (address => uint) balance ; 
    
   
    modifier isOwner() { 
        require(owner == msg.sender, "you are not allowd")  ;
        _;  
        }
    
    
    
    function transferTest(address payable _reciever, uint _value) public { 
balance[msg.sender] -= _value ; 
balance[_reciever] += _value ; 
emit transfer(msg.sender, _reciever, _value) ;
    }



    function send() public payable {
    
        if(msg.value < 2 ether)
    {
        revert("too little money!") ; 
    }
    
    }


    function getBalance() public view returns(uint) { 
        return address(this).balance ; 
    }
    function getBalance(address adrs) public view returns (uint) { 
        return adrs.balance ; 
    }


    function transferMoney(address payable _reciever, uint _amount) public { 
        _reciever.transfer(_amount) ;
    }

    function transferMoneyNew(address _reciever, uint _amount) public {
        
        payable(_reciever).transfer(_amount);
    }

    function transferMoneyNew2(uint _amount) public {
        
        payable(msg.sender).transfer(_amount);
    }


}

