// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Errors {

    uint256 public totalBalance;
    mapping(address => uint) public userBalance;

    error ExceedingAmount(address user, uint256 exceedingAmount);
    error Deny(string reason);

    receive() external payable {
        revert Deny("No direct payments");
    }

    fallback() external payable {
        revert Deny("No direct payments");
    }

    function pay() noZero(msg.value) external payable{
        require(msg.value == 1 ether,"Only payments in 1 ether");

        totalBalance += msg.value;
        userBalance[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) noZero(_amount) external {

        uint256 initialBalance = totalBalance;

        if( userBalance[msg.sender] < _amount) {
            //revert("Insufficient balance!!");
            revert ExceedingAmount(msg.sender,_amount - userBalance[msg.sender]);
        }

        totalBalance -=_amount;
        userBalance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);

        assert(totalBalance < initialBalance);
    }

    modifier noZero(uint256 _amount) {
        require(_amount != 0, "Amount can not be 0 !!");
        _;
    }
}