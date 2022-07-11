
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^ 0.8.7  ; 


contract sample3 { 
    
    address public  owner ; 

    constructor() {
        owner = msg.sender ; 
    }
    modifier isOwner() { 
        require(owner == msg.sender, "you are not allowd")  ;
        _;  
        }


    function testModifier() public isOwner { 

    }

}

contract Bank { 
    uint amount ; 
    function deposit(uint _value) public { 
        amount += _value ; 

    }
    function withdraw(uint _value) public  { 
        amount -= _value ; 
    }
    function balance() public view returns (uint) { 
        return amount ; 
    }
}

contract User is Bank { 
    constructor(uint _value) { 
        amount = _value ; 
    }

    function testLib(uint a , uint b) public pure returns (uint) { 
       return  safeMath.sum(a, b) ; 
    }

}

library safeMath {
    function sum(uint a,uint b) public pure returns(uint) { 
        
       return a + b ; 
    }
    function div(uint a,uint b) public pure returns(uint) { 
        require(b!=0, "devision by zero") ; 
        return a/b ; 
    }
    function mul(uint a, uint b) public pure returns(uint) { 
        return a*b ; 
    }
    function min(uint a , uint b ) public pure returns(uint) { 
        return a-b ; 
    }
   
}
// interface sample { 
// function withdraw(uint) ; 
// function balance() returns (uint) ; 
// }
