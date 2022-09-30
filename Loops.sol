// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


contract Loops {
    uint256[15] private numbers0;
    uint256[15] private numbers1;

    function listByFor() public {
        uint256[15] memory nums = numbers0;
        for(uint256 i = 0; i < nums.length; i++ ) {
            nums[i] = i;
        }

        numbers0 = nums;
    }

    function getNumbers0() public view returns(uint256[15] memory) {
        return numbers0;
    }

    function listByWhile() public {
        uint256 i;
        while(i < numbers1.length) {
            numbers1[i] = i;
            i++;
        }
    }

    function getNumbers1() public view returns(uint256[15] memory) {
        return numbers1;
    }

}