// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract LinkedInMessaging {
    // Structure for a message
    struct Message {
        address sender;
        address recipient;
        string content;
        uint timestamp;
    }

    // Mapping of all messages
    mapping(address => Message[]) private messages;

    // Event to be emitted on a new message
    event NewMessage(address recipient, uint timestamp);

    // Function to send a message
    function sendMessage(address recipient, string memory content) public {
        Message memory message = Message({
            sender: msg.sender,
            recipient: recipient,
            content: content,
            timestamp: block.timestamp
        });

        // Add the message to the sender's list of messages
        messages[msg.sender].push(message);

        // Add the message to the recipient's list of messages
        messages[recipient].push(message);

        // Emit an event for the new message
        emit NewMessage(recipient, message.timestamp);
    }

    // Function to retrieve all messages for a member
    function getMessages(address member) public view returns (Message[] memory) {
        return messages[member];
    }
}
