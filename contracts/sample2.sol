
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^ 0.8.7 ; 

contract firstTest { 
    string name ; 
    // string storage name ; // داده های مهم و پر هزینه 
    // string memory name ; //
    
    constructor()  {
        name  = "SLS Blockchain Course" ; 
    }

    // constructor(string memory _test) { 
    //     name = _test ;
    // }

    function setname(string memory _name ) public { 
        name = _name ; 
    }

    function getName() public view returns(string memory) { 
        return name ; 
    }

    function testAdd(uint a , uint b, uint c) public pure returns (uint)  {
        return addmod(a, b, c) ; 
    }

    function testHash(string memory _input) public pure returns(bytes32) {
        return keccak256(abi.encode(_input)) ; 

    }

    struct Student { 
        string  name ; 
        uint grade ; 
    }


    Student[] stdArray ; 
    mapping(address=>Student) nameAmal ;

    function testStruct() public { 
        Student memory  st1 = Student("amir",15) ;
        st1.name = "ehsan" ; 

        stdArray.push(Student("ali", 20)) ; 
        nameAmal[msg.sender] = Student("hasan", 20) ;
        // require(msg.value > 10 ,  "too little ethereum" )  ;
        // assert(msg.value, "too little money" ) ;
        // if(msg.value < 10 ether) { 
        //     revert() ; 
        // }
    }

    uint[] arr ; 
    function testArray() public { 
        arr.push(10) ;
        arr.push(12) ;
        arr.push(13) ;

        arr[0] = 12 ; 
        arr[0] ; 
        delete arr[2] ; 
    }

//     function testMemoryArray() public {
//         uint[] memory array  = new uint[](5) ; 
//         array[0] = 10 ; 
//         array[1] = 20  ; 
//         array[2] = 30 ; 
//         delete array[0] ; 
        
//    }

   mapping (address=>uint ) balance ; // a ddress = value
   mapping (uint=> mapping(address=> uint)) balanceList ;  // balance[iddex][address] = value
    mapping (address => uint[]) balances ; 
   function testMapping() public { 
       balance[msg.sender] = 1000 ; 
       delete balance[msg.sender] ; 
       balance[msg.sender] ; 

   }

   function testNestedMapping(uint _id) public { 
       balanceList[_id][msg.sender] = 1000 ;
       balanceList[_id][msg.sender] = 1001 ; 
       balanceList[_id][msg.sender] ; 

   }

   function testArrayMapping(uint _id) public { 
       balances[msg.sender][_id] = 1000 ; 
       balances[msg.sender].push(2000) ; 
       balances[msg.sender][2] ; 
   }

}