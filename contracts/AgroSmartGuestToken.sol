// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title AgroSmartGuestToken
 * @dev Manages digital booking escrows, loyalty rewards, and local agritourism vouchers.
 */
contract AgroSmartGuestToken {
    address public owner;
    address public geminiAIOracle;

    mapping(address => uint256) public bookingEscrow;
    mapping(address => uint256) public loyaltyPoints;

    event BookingCreated(address indexed guest, uint256 amountUsd);
    event RewardsIssued(address indexed guest, uint256 points);

    modifier onlyOracleOrOwner() {
        require(msg.sender == owner || msg.sender == geminiAIOracle, "Unauthorized access");
        _;
    }

    constructor(address _geminiAIOracle) {
        owner = msg.sender;
        geminiAIOracle = _geminiAIOracle;
    }

    function createBooking(address _guest, uint256 _amountUsd) external payable onlyOracleOrOwner {
        bookingEscrow[_guest] += _amountUsd;
        loyaltyPoints[_guest] += _amountUsd / 10; // 10% loyalty cashback in points
        emit BookingCreated(_guest, _amountUsd);
        emit RewardsIssued(_guest, loyaltyPoints[_guest]);
    }
}
