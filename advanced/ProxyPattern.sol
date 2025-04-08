// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// Proxy contract (storage layout must match implementation)
contract Proxy {
    address public implementation;

    function upgradeTo(address _newImplementation) external {
        implementation = _newImplementation;
    }

    receive() external payable {
        // Accept plain Ether transfers
    }

    fallback() external payable {
        address impl = implementation;
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), impl, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
        }
    }
}

// Implementation v1
contract FreelanceV1 {
    uint public jobCount;
}

// Implementation v2 (Upgraded)
contract FreelanceV2 {
    uint public jobCount;
    mapping(uint => string) public jobDescriptions; // New feature
}


// note: 
// Upgrade Flow
// Deploy Proxy and FreelanceV1.

// Point proxy to FreelanceV1.

// Later, deploy FreelanceV2 and call upgradeTo(FreelanceV2).