// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract ValueChecker {
    function checkValue(uint value) public pure {
        require(value > 10, "Value must be greater than 10");
        //or
        assert(value != 100); // Internal check
        if (value == 50) {
            revert("50 is not allowed");
        }
    }
}

// purpose: Error Handling 