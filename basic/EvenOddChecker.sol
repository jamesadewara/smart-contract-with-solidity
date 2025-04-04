// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract EvenOddChecker {
    function checkNumber(uint num) public pure returns (string memory) {
        if (num % 2 == 0) {
            return "Even";
        } else {
            return "Odd";
        }
    }
}
// purpose: Conditionals