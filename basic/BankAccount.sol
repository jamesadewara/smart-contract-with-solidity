// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract BankAccount {
    uint private balance;
    
    // Public function to deposit money
    function deposit(uint amount) public {
        balance += amount;
    }
    
    // External function to withdraw money
    function withdraw(uint amount) external {
        require(amount <= balance, "Insufficient funds");
        balance -= amount;
    }
    
    // Internal function for interest calculation
    function addInterest(uint rate) internal {
        balance += (balance * rate) / 100;
    }
    
    // View function to check balance
    function getBalance() public view returns (uint) {
        return balance;
    }
}

// purpose: Functions and Visibility