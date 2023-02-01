// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;



contract LinkedInNewsFeed {
    struct Article {
        string title;
        string author;
        string content;
        uint timestamp;
    }

    mapping (address => uint[]) userArticles;
    mapping (uint => Article) articles;
    uint articleCount = 0;

    function addArticle(string memory _title, string memory _author, string memory _content) public {
        articles[articleCount] = Article(_title, _author, _content, block.timestamp);
        userArticles[msg.sender].push(articleCount);
        articleCount++;
    }

    function getArticle(uint _index) public view returns (string memory, string memory, string memory, uint) {
        Article storage article = articles[_index];
        return (article.title, article.author, article.content, article.timestamp);
    }

    function getUserArticles(address _user) public view returns (uint[] memory) {
        return userArticles[_user];
    }
}
