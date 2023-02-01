// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;




contract LinkedInNotification {
    // Define an event for notifications
    event Notification(
        string message,
        uint timestamp
    );

    // Define a function to trigger the event and emit the notification
    function sendNotification(string memory message) public {
        emit Notification(message, block.timestamp);
    }
}

