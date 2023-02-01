// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Connections {
    // Mapping of members and their connections
    mapping (address => mapping (address => bool)) public connections;

    // Event for new connections
    event NewConnection(address indexed member1, address indexed member2);

    // Function to connect two members
    function connect(address member2) public {
        connections[msg.sender][member2] = true;
        connections[member2][msg.sender] = true;
        emit NewConnection(msg.sender, member2);
    }

    // Function to check if two members are connected
    function areConnected(address member1, address member2) public view returns (bool) {
        return connections[member1][member2];
    }
}