// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Functions {

    uint public luckyNumber = 7;

    function showNumber() public view returns (uint) {
        return luckyNumber;
    }

    function setNumer(uint number) public {
        luckyNumber = number;
    }

    function getTime() public view returns (uint) {
        return block.timestamp;
    }

    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    // Public, External, Internal, Private

    // Private

    function privateKeyword() private pure returns (string memory) {
        return "Bu bir private fonksiyondur.";
    }

    function callPrivateKeyword() public pure returns (string memory) {
        return privateKeyword();
    }

    // Internal => Sadece miras alan kontratlar bu fonksiyonu çağırabilir.
    // Dışarıdan kullancılar erişemez. Private gibi davranır.
    
    function internalKeyword() internal pure returns (string memory) {
        return "Bu bir internal fonksiyondur.";
    }

    function callInternalKeyword() public pure returns (string memory) {
        return internalKeyword();
    }

    // External => dışarıdan kullanıcılar çağırabilir fakat kontrat içinde çağrılamaz.

    function externalKeyword() external pure returns (string memory) {
        return "Bu bir external fonksiyondur.";
    }

    // function callExternalKeyword() public pure returns (string memory) {
    //     return externalKeyword(); // Hata verir
    // }
}