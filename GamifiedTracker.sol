// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract GamifiedTaskTracker {
    address public admin;
    uint public constant POINTS_PER_TASK = 15;
    uint public constant REWARD_LIMIT = 60;
    uint public constant TASK_COMPLETION_DURATION = 86400; // 24 hours in seconds

    struct Mission {
        string title;
        string details;
        uint createdAt;
        bool isFinished;
    }

    mapping(address => Mission[]) private missions;
    mapping(address => uint) private userPoints;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can perform this action");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    // Add a new mission for the sender
    function addMission(string memory _title, string memory _details) public {
        require(bytes(_title).length > 0, "Mission title cannot be empty");
        require(bytes(_details).length > 0, "Mission details cannot be empty");

        missions[msg.sender].push(Mission(_title, _details, block.timestamp, false));
    }

    // Mark a mission as finished and grant points if completed within 24 hours
    function finishMission(uint _missionIndex) public {
        require(_missionIndex < missions[msg.sender].length, "Invalid mission index");

        Mission storage mission = missions[msg.sender][_missionIndex];
        require(!mission.isFinished, "Mission is already finished");

        // Verify if the mission is being marked as finished within the allowed time frame
        if (block.timestamp <= mission.createdAt + TASK_COMPLETION_DURATION) {
            mission.isFinished = true;
            userPoints[msg.sender] += POINTS_PER_TASK; // Add points for mission completion
        } else {
            revert("Mission completion window expired");
        }
    }

    // Use accumulated points once the user meets the reward limit
    function claimPoints(uint _amount) public {
        require(userPoints[msg.sender] >= _amount, "Not enough points to claim");

        uint initialPoints = userPoints[msg.sender];
        userPoints[msg.sender] -= _amount;

        // Ensure the points calculation is accurate
        assert(userPoints[msg.sender] == initialPoints - _amount);
    }

    // Retrieve the user's total points balance
    function viewPoints() public view returns (uint) {
        return userPoints[msg.sender];
    }

    // Retrieve the list of missions for the user
    function viewMissions() public view returns (Mission[] memory) {
        return missions[msg.sender];
    }
}
