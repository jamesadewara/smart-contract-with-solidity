// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract VotingSystem {
    struct Candidate {
        string name;
        uint voteCount;
    }
    
    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public hasVoted;
    
    function addCandidate(uint id, string memory name) public {
        candidates[id] = Candidate(name, 0);
    }
    
    function vote(uint candidateId) public {
        require(!hasVoted[msg.sender], "Already voted");
        candidates[candidateId].voteCount++;
        hasVoted[msg.sender] = true;
    }
}

// purpose: Structs and Mappings