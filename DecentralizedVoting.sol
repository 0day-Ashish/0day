// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedVoting {
    address public admin;

    struct Proposal {
        uint256 id;
        string description;
        uint256 voteCount;
        uint256 deadline;
        bool exists;
        bool executed;
        mapping(address => bool) hasVoted;
    }

    uint256 public proposalCount;
    mapping(uint256 => Proposal) public proposals;

    event ProposalCreated(uint256 id, string description, uint256 deadline);
    event Voted(uint256 id, address voter);
    event ProposalExecuted(uint256 id);

    constructor() {
        admin = msg.sender;
    }

    modifier onlyBeforeDeadline(uint256 _proposalId) {
        require(block.timestamp < proposals[_proposalId].deadline, "Voting closed");
        _;
    }

    modifier proposalExists(uint256 _proposalId) {
        require(proposals[_proposalId].exists, "Proposal does not exist");
        _;
    }

    modifier notVotedYet(uint256 _proposalId) {
        require(!proposals[_proposalId].hasVoted[msg.sender], "Already voted");
        _;
    }

    function createProposal(string calldata _description, uint256 _durationInMinutes) external {
        proposalCount++;
        Proposal storage p = proposals[proposalCount];
        p.id = proposalCount;
        p.description = _description;
        p.exists = true;
        p.deadline = block.timestamp + (_durationInMinutes * 1 minutes);

        emit ProposalCreated(p.id, _description, p.deadline);
    }

    function vote(uint256 _proposalId)
        external
        proposalExists(_proposalId)
        onlyBeforeDeadline(_proposalId)
        notVotedYet(_proposalId)
    {
        Proposal storage p = proposals[_proposalId];
        p.voteCount++;
        p.hasVoted[msg.sender] = true;

        emit Voted(_proposalId, msg.sender);
    }

    function getProposal(uint256 _proposalId)
        external
        view
        proposalExists(_proposalId)
        returns (
            string memory description,
            uint256 voteCount,
            uint256 deadline,
            bool executed
        )
    {
        Proposal storage p = proposals[_proposalId];
        return (p.description, p.voteCount, p.deadline, p.executed);
    }

    function hasVoted(uint256 _proposalId, address _voter) external view returns (bool) {
        return proposals[_proposalId].hasVoted[_voter];
    }

    function executeProposal(uint256 _proposalId)
        external
        proposalExists(_proposalId)
    {
        Proposal storage p = proposals[_proposalId];
        require(block.timestamp >= p.deadline, "Voting not ended");
        require(!p.executed, "Already executed");

        // Could add logic here, like DAO actions
        p.executed = true;

        emit ProposalExecuted(_proposalId);
    }
}
