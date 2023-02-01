
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract LinkedInLearning {
    // Events
    event NewCourse(string courseName, uint price);
    event NewEnrollment(address enrolledAddress, string courseName);

    // Structs
    struct Course {
        string courseName;
        uint price;
    }

    // Mapping
    mapping (string => Course) public courses;
    mapping (address => mapping (string => bool)) public enrollments;

    // Functions
    function addCourse(string memory _courseName, uint _price) public {
        courses[_courseName] = Course(_courseName, _price);
        emit NewCourse(_courseName, _price);
    }

    function enroll(string memory _courseName) public payable {
        require(courses[_courseName].price <= msg.value, "Not enough funds");
        enrollments[msg.sender][_courseName] = true;
        emit NewEnrollment(msg.sender, _courseName);
    }

    function checkEnrollment(string memory _courseName) public view returns (bool) {
        return enrollments[msg.sender][_courseName];
    }
}
