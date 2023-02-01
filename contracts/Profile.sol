// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;



contract LinkedInProfile {
    // Personal Information
    string public fullName;
    string public gender;
    string public headline;
    string public location;
    string public industry;
    string public summary;
    string public pictureUri;

    // Work Experience
    struct WorkExperience {
        string companyName;
        string jobTitle;
        string startDate;
        string endDate;
        string description;
    }
    WorkExperience[] public workExperiences;

    // Education
    struct Education {
        string schoolName;
        string degree;
        string fieldOfStudy;
        string startDate;
        string endDate;
    }
    Education[] public educations;

    // Skills
    string[] public skills;

    // Updates
    string[] public updates;

    // Functions
    function setFullName(string memory _fullName) public {
        fullName = _fullName;
    }
     function setGender(string memory _gender) public {
       gender = _gender;
    }

    function updatePictureUri(string memory _pictureUri) public {
        pictureUri = _pictureUri;
    }

    function setHeadline(string memory _headline) public {
        headline = _headline;
    }

    function setLocation(string memory _location) public {
        location = _location;
    }

    function setIndustry(string memory _industry) public {
        industry = _industry;
    }

    function setSummary(string memory _summary) public {
        summary = _summary;
    }

    function addWorkExperience(string memory _companyName, string memory _jobTitle, 
                               string memory _startDate, string memory _endDate, 
                               string memory _description) public {
        WorkExperience memory newWorkExperience = WorkExperience({
            companyName: _companyName,
            jobTitle: _jobTitle,
            startDate: _startDate,
            endDate: _endDate,
            description: _description
        });
        workExperiences.push(newWorkExperience);
    }

    function addEducation(string memory _schoolName, string memory _degree, 
                         string memory _fieldOfStudy, string memory _startDate, 
                         string memory _endDate) public {
        Education memory newEducation = Education({
            schoolName: _schoolName,
            degree: _degree,
            fieldOfStudy: _fieldOfStudy,
            startDate: _startDate,
            endDate: _endDate
        });
        educations.push(newEducation);
    }

    function addSkill(string memory _skill) public {
        skills.push(_skill);
    }

    function addUpdate(string memory _update) public {
        updates.push(_update);
    }
}
