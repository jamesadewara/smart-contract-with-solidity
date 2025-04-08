// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// Vulnerable Contract
contract VulnerableBank {
    mapping(address => uint) public balances;

    function withdraw() public {
        uint balance = balances[msg.sender];
        (bool sent, ) = msg.sender.call{value: balance}("");
        require(sent, "Failed");
        balances[msg.sender] = 0;
    }
}

// Fixed with Checks-Effects-Interactions
contract SecureBank {
    mapping(address => uint) public balances;
    bool private locked;

    modifier noReentrancy() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function withdraw() public noReentrancy {
        uint balance = balances[msg.sender];
        balances[msg.sender] = 0; // Effects first
        (bool sent, ) = msg.sender.call{value: balance}(""); // Interaction last
        require(sent, "Failed");
    }
}

// note:
// Attack Scenario
// Attacker calls withdraw().

// Before balance is set to 0, their fallback function calls withdraw() again.

// Drains the contract.