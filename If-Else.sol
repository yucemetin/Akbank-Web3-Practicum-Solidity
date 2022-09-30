// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


contract IfElse {

    bytes32 private hashedPassword;
    uint private loginCount;

    constructor(string memory _password) {
        hashedPassword = keccak256(abi.encode(_password));
    }

    function login(string memory _password) public returns(bool) {
        if (hashedPassword == keccak256(abi.encode(_password))) {
            loginCount++;
            return true;
        } else {
            return false;
        }
    }

    function login2(string memory _password) public view returns (bool) {
        return (hashedPassword == keccak256(abi.encode(_password))) ? true : false;
    }

    function loginStatus() public view returns(uint) {
        if (loginCount == 0) {
            return 0;
        } else if(loginCount > 0 && loginCount !=1) {
            return 1;
        } else if(loginCount == 1) {
            return 2;
        } else {
            return 3;
        }
    }
}