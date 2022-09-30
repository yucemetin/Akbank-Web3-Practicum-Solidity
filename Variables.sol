// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


contract Variables {

    // state variables
    uint public number0 = 36;

    function show() public pure returns(uint) {
        // local variables
        uint luckyNumber = 0;
        return luckyNumber;
    }

    function show2() public view returns (uint) {
        // global variables
        block.difficulty;
        block.gaslimit;
        block.timestamp;
        msg.sender;

        return block.number;
    }

    // Fixed-Size Types

    bool isTrue = false;

    // Static-Size Types

    int8 number = 12;
    uint number2 = 12;

    address myAddress = 0x2477D908816EEabc62E2B45DABcE2E6E6Bd2A041;
    bytes32 name4 = "Metin Yuce 24";

    // Dynamic-Size Types

    string name2 = "Metin Yuce";
    bytes name3 = "Metin";

    uint[] array = [1,2,3,4,5];
    mapping(uint => string) list;

    function addList() public {
        list[0] = "Metin";
        list[1] = "Yuce";
        list[2] = "Kars";
    }

    function get(uint num) public view returns ( string memory ) {
        return list[num];
    }
    
    // User Defined Value Types

    struct Person {
        uint id;
        string firstName;
        string lastName;
        uint age;
    }

    Person person;

    function setPerson() public{
        person.id = 0;
        person.firstName = "Metin";
        person.lastName = "Yuce";
        person.age = 24;
    }
    
    function getPerson() public view returns (uint, string memory, string memory , uint){
        return (person.id, person.firstName, person.lastName, person.age);
    }

    enum trafficLight {
        RED,
        YELLOW,
        GREEN
    }

    trafficLight light = trafficLight.GREEN;

    function getLight() public view returns(trafficLight) {
        return light;
    }

    // 1 wei = 1;
    // 1 ether = 10^18 wei;
    // 1 gwei = 10^9 wei;
    
}