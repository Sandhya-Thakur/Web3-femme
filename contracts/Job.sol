
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract LinkedInJobs {
    struct Job {
        string title;
        string company;
        string description;
        address poster;
        uint256 deadline;
        uint256 id;
        bool filled;
    }

    mapping (uint256 => Job) public jobs;
    uint256 public jobCount;

    event JobPosted(
        uint256 indexed id,
        string title,
        string company,
        string description,
        address poster,
        uint256 deadline
    );

    event ApplicationSubmitted(
        uint256 indexed jobId,
        address applicant
    );

    event JobFilled(
        uint256 indexed jobId,
        address hiree
    );

    function postJob(
        string memory _title,
        string memory _company,
        string memory _description,
        uint256 _deadline
    ) public {
        jobCount ++;
        jobs[jobCount] = Job(
            _title,
            _company,
            _description,
            msg.sender,
            _deadline,
            jobCount,
            false
        );

        emit JobPosted(
            jobCount,
            _title,
            _company,
            _description,
            msg.sender,
            _deadline
        );
    }

    function applyToJob(uint256 _jobId) public {
        Job storage job = jobs[_jobId];

        require(
            !job.filled,
            "This job has already been filled."
        );
        require(
            job.deadline >= block.timestamp,
            "This job's application deadline has passed."
        );

        job.filled = true;

        emit ApplicationSubmitted(_jobId, msg.sender);
        emit JobFilled(_jobId, msg.sender);
    }
}
