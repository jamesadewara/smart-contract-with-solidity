// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "@openzeppelin/contracts/access/AccessControl.sol";

contract FreelancePlatform is AccessControl {
    bytes32 public constant CLIENT_ROLE = keccak256("CLIENT");
    bytes32 public constant FREELANCER_ROLE = keccak256("FREELANCER");

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function hireFreelancer(address freelancer) public onlyRole(CLIENT_ROLE) {
        _grantRole(FREELANCER_ROLE, freelancer);
    }
}