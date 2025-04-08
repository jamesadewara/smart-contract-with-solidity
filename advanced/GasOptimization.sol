// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract GasOptimization {
    // Bad: Uses more storage (20,000 gas per write)
    uint256 public count1;
    string public name1 = "Unoptimized";

    // Good: Pack variables (cheaper storage)
    uint128 public count2;  // Uses 1 storage slot with `name2`
    string public name2 = "Optimized";

    // Bad: Expensive loop
    function sumArray(uint256[] memory arr) public pure returns (uint256) {
        uint256 total;
        for (uint256 i = 0; i < arr.length; i++) { // Reads length on every iteration
            total += arr[i];
        }
        return total;
    }

    // Good: Cache array length
    function sumArrayOptimized(uint256[] memory arr) public pure returns (uint256) {
        uint256 total;
        uint256 length = arr.length; // Cache once
        for (uint256 i = 0; i < length; i++) {
            total += arr[i];
        }
        return total;
    }
}

// note:
// Think of gas like fuel in a car:

// Storage writes = Filling up a tank (expensive)

// Memory ops = Using the AC (cheap)

// Loop optimizations = Taking the highway (shorter route)