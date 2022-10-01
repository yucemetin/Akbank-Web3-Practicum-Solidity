// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Mapping {
    mapping(address => bool) public registered;
    mapping(address => uint) public favNumber;

    function register(uint _favNumber) public {
        require(!isRegistered() , "Kullanici zaten kayit yapti!!");
        registered[msg.sender] = true;
        favNumber[msg.sender] = _favNumber;
    }

    function isRegistered() public view returns (bool) {
        return registered[msg.sender];
    }

    function deleteRegistered() public {
        require(isRegistered() ,"Kullanici kayitli degil!!");
        
        delete(registered[msg.sender]);
        delete(favNumber[msg.sender]);

    }
}

contract NestedMapping {
    mapping(address => mapping(address => uint)) public debts;

    function incDebt(address _barrower, uint _amount) public {
        debts[msg.sender][_barrower] += _amount;
    }

    function decDebt(address _barrower, uint _amount) public {
       require(debts[msg.sender][_barrower] >= _amount, "Not enough debt");
        debts[msg.sender][_barrower] -= _amount;
    }

    function getDebt(address _barrower) public view returns (uint) {
        return debts[msg.sender][_barrower];
    }
}