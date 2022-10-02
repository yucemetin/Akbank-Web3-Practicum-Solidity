// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


// bir kontrat başka bir kontratı çağırdığı zaman
// msg.sender kullanıcı değil kontratın kendi adresi olur.
// msg.sender -> A -> B 
// A kontratını çağıran msg.senderdır.
// B kontratını çağıran ise A kontratının adresidir.

// msg.sender -> A (mesaj yollayan : msg.sender) -> B (mesaj yollayan : A adresi)

contract Interact {
    address public caller;
    mapping(address=> uint) public counts;

    function callThis() external {  
        caller = msg.sender;
        counts[msg.sender]++;
    }
}

contract Pay {
    mapping(address => uint) public userBalances;

    function payEther(address _payer) external payable {
        userBalances[_payer] += msg.value;
    }
}

contract Caller {
    Interact interact;
    
    constructor(address _interact) {
        interact = Interact(_interact);
    }

    function callInteract() external {
        interact.callThis();
    }
    
    function readCaller() external view returns(address) {
        return interact.caller();
    }

    function readCallerCount() external view returns(uint) {
        return interact.counts(msg.sender);
    }

    function payToPay(address _payer) public payable {
        //Pay pay = Pay(_payer);
        //pay.payEther{value: msg.value}(msg.sender);
        Pay(_payer).payEther{value: msg.value}(msg.sender);
    }

    function sendEthByTransfer() public payable {
        payable(address(interact)).transfer(msg.value);
    }
}   