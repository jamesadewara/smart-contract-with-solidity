// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract PaymentGateway {
    uint public value = 1 ether;

    receive() external payable {
        // Function to receive Ether directly through a smart contract using the receive function. msg.value will be the amount of Ether sent to the contract.
    }

    fallback() external payable {
        // Fallback function to handle Ether sent to the contract without any data if the receive function was not implemented. msg.value will be the amount of Ether sent to the contract.
        value++;
    }

    function checkBalance() public view returns (uint) {
        return address(this).balance;
    }

    function transfer(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed");
    }
}

// purpose: Ether and Payments
//any function can receive ether as long as you use the payable keyword
