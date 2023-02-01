// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Company {
    // Company Information
    string public name;
    string public description;
    string public website;

    // Employee Information
    struct Employee {
        string name;
        string title;
        string profile;
    }

    Employee[] public employees;

    // Job Listing Information
    struct JobListing {
        string title;
        string description;
        uint salary;
    }

    JobListing[] public jobListings;

    // Constructor
    constructor(string memory _name, string memory _description, string memory _website) public {
        name = _name;
        description = _description;
        website = _website;
    }

    // Add Employee
    function addEmployee(string memory _name, string memory _title, string memory _profile) public {
        employees.push(Employee(_name, _title, _profile));
    }

    // Add Job Listing
    function addJobListing(string memory _title, string memory _description, uint _salary) public {
        jobListings.push(JobListing(_title, _description, _salary));
    }

    // Get Company Information
    function getCompanyInfo() public view returns (string memory, string memory, string memory) {
        return (name, description, website);
    }

    // Get Employee Information
    function getEmployee(uint index) public view returns (string memory, string memory, string memory) {
        Employee storage employee = employees[index];
        return (employee.name, employee.title, employee.profile);
    }

    // Get Job Listing Information
    function getJobListing(uint index) public view returns (string memory, string memory, uint) {
        JobListing storage job = jobListings[index];
        return (job.title, job.description, job.salary);
    }
}
