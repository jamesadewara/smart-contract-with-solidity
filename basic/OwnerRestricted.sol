// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract OwnerRestricted {
    address public owner;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }
    
    constructor() {
        owner = msg.sender;
    }
    
    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}

// purpose: Modifiers