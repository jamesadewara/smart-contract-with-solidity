// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract MessageNotifier {
    event MessageChanged(address indexed sender, string newMessage);
    
    string public message;
    
    function updateMessage(string memory newMessage) public {
        message = newMessage;
        emit MessageChanged(msg.sender, newMessage);
    }
}

// purpose: Events are used to log information on the blockchain. In this example, the `MessageNotifier` contract emits an event `MessageChanged` whenever the message is updated. This allows external applications (like front-end interfaces) to listen for changes and react accordingly.