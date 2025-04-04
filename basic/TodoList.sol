// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract TodoList {
    string[] public todos;

    function addTodo(string memory task) public {
        todos.push(task);
    }

    function completeTodo(uint index) public {
        delete todos[index];
    }

    function getTodoCount() public view returns (uint) {
        return todos.length;
    }

    function getTodoById(uint index) public view returns (string memory) {
        require(index < todos.length, "Index out of bounds");
        return todos[index];
    }

    function replaceTodoById(uint index, string memory newTask) public {
        require(index < todos.length, "Index out of bounds");
        todos[index] = newTask;
    }
}

// purpose Arrays data structure
