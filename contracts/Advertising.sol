// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract LinkedInAd {

    struct Ad {
        uint id;
        address advertiser;
        string content;
        uint targetSegment;
        uint startDate;
        uint endDate;
        uint impressions;
        uint clicks;
    }

    mapping (uint => Ad) public ads;
    uint public adCount;

    enum Segment { All, Professional, Student, Recruiter }

    function createAd(address _advertiser, string memory _content, uint _targetSegment, uint _startDate, uint _endDate) public {
        adCount++;
        ads[adCount] = Ad(adCount, _advertiser, _content, _targetSegment, _startDate, _endDate, 0, 0);
    }

    function viewAd(uint _id) public {
        Ad storage ad = ads[_id];
        require(block.timestamp >= ad.startDate && block.timestamp <= ad.endDate, "Ad is not currently running");
        ad.impressions++;
    }

    function clickAd(uint _id) public {
        Ad storage ad = ads[_id];
        require(block.timestamp >= ad.startDate && block.timestamp <= ad.endDate, "Ad is not currently running");
        ad.clicks++;
    }

    function getAdImpressions(uint _id) public view returns (uint) {
        return ads[_id].impressions;
    }

    function getAdClicks(uint _id) public view returns (uint) {
        return ads[_id].clicks;
    }
}
