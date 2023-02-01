// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract LinkedInGroups {
    // Events
    event NewGroupCreated(
        uint256 groupId,
        string groupName,
        address creator
    );

    event GroupMemberAdded(
        uint256 groupId,
        address member
    );

    // Structs
    struct Group {
        string name;
        mapping(address => bool) members;
    }

    // Mapping
    mapping(uint256 => Group) public groups;

    // Group Counter
    uint256 public groupCounter;

    // Functions
    function createGroup(string memory _groupName) public {
        groups[groupCounter].name = _groupName;
        groups[groupCounter].members[msg.sender] = true;
        groupCounter++;
        emit NewGroupCreated(groupCounter, _groupName, msg.sender);
    }

    function joinGroup(uint256 _groupId) public {
        groups[_groupId].members[msg.sender] = true;
        emit GroupMemberAdded(_groupId, msg.sender);
    }

    function leaveGroup(uint256 _groupId) public {
        groups[_groupId].members[msg.sender] = false;
    }

    function isMember(uint256 _groupId) public view returns (bool) {
        return groups[_groupId].members[msg.sender];
    }
}
