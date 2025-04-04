// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Animal {
    function speak() public pure virtual returns (string memory) {
        return "Animal sound";
    }
}

contract Dog is Animal {
    function speak() public pure override returns (string memory) {
        return "Woof!";
    }
}

contract Cat is Animal {
    function speak() public pure override returns (string memory) {
        return "Meow!";
    }
}

// purpose: Inheritance