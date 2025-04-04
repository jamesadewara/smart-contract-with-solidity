// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

interface IERC20 {
    function transfer(address to, uint amount) external returns (bool);
}

contract TokenTransfer {
    IERC20 public token;
    
    constructor(address tokenAddress) {
        token = IERC20(tokenAddress);
    }
    
    function sendTokens(address receiver, uint amount) public {
        require(token.transfer(receiver, amount), "Transfer failed");
    }
}

// purpose: Interfaces are used to define a contract's external functions without implementing them. This allows for interaction with other contracts without needing to know their internal workings. In this example, the `IERC20` interface defines the `transfer` function, which is used in the `TokenTransfer` contract to send tokens to a specified address.