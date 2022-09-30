// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Constructor {
    string public constant tokenName = "Avax";
    uint public immutable totalSupply;

    constructor( uint number) {
        totalSupply = number;
    }
}