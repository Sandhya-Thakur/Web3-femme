// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract LinkedInEndorsement {
    struct Endorsement {
        address endorser;
        bytes32 skill;
    }

    struct Recommendation {
        address recommender;
        bytes32 recommendation;
    }

    mapping (address => mapping (bytes32 => Endorsement[])) endorsements;
    mapping (address => mapping (bytes32 => Recommendation[])) recommendations;

    function endorse(address _endorsed, bytes32 _skill) public {
        Endorsement memory endorsement = Endorsement({
            endorser: msg.sender,
            skill: _skill
        });

        endorsements[_endorsed][_skill].push(endorsement);
    }

    function recommend(address _recommended, bytes32 _recommendation) public {
        Recommendation memory recommendation = Recommendation({
            recommender: msg.sender,
            recommendation: _recommendation
        });

        recommendations[_recommended][_recommendation].push(recommendation);
    }

    function getEndorsements(address _endorsed, bytes32 _skill) public view returns (Endorsement[] memory) {
        return endorsements[_endorsed][_skill];
    }

    function getRecommendations(address _recommended, bytes32 _recommendation) public view returns (Recommendation[] memory) {
        return recommendations[_recommended][_recommendation];
    }
}
