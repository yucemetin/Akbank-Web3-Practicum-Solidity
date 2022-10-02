// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// virtual
contract A {
    uint public x;
    uint public y;

    function setX(uint _x) virtual public {
        x = _x;
    }

    function setY(uint _y) public {
        y = _y;
    }
}
// override

contract B is A{
    uint public z;
    
    function setZ(uint _z) public {
        z = _z;
    }

    function setX(uint _x) override public {
        x = _x +2;
    } 
}

contract Human {
    function sayHello() public pure virtual returns(string memory) {
        return "Hello Human :)";
    }
}

contract SuperHuman is Human {
    function sayHello() public pure override returns(string memory) {
        return "Hello Super Human :)";
    }

    function welcomeMessage(bool isNew) public pure returns(string memory) {
        return isNew ? sayHello() : super.sayHello();
    }
}


// Başka bir kontratı inherit etmek

import "@openzeppelin/contracts/access/Ownable.sol";

contract Wallet is Ownable {
    fallback() payable external {}

    receive() payable external {}

    function sendEther(address payable to, uint amount) onlyOwner public {
        to.transfer(amount);
    }

    function showBalance() public view returns(uint) {
        return address(this).balance;
    }
}