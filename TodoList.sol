// SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

contract TodoList {

    // Variables 
    struct Task { 
        string title;
        string description; 
        bool isDone; 
    }
    Task public task;

    Task[] public list;

    // Modifiers
    modifier checkListLength(uint256 index) {
        if (index > list.length -1 ) revert("Index not existing on the list");
        _;
    }

    // Events
    event taskCreated(string title, string description, bool isDone);
    // Read a task
    event readATask(Task task);
    // Read the list
    event readTheList(Task list);

    // External Functions
    // Function to create a new task and add to the list
    function createTask(string memory title_, string memory description_, bool isDone_) public {
        task = Task(title_, description_, isDone_);
        list.push(task);
        emit taskCreated(title_, description_, isDone_);
    }

    // Function to read a task given an index
    function readTask(uint256 index_) checkListLength(index_) public {
        task = list[index_];
        emit readATask(task);
    }

    // Function to mark as done a task only if it isn't
    function updateIsDoneTask(uint index_) checkListLength(index_) public {
        require(list[index_].isDone == false, "Status isDone is already true");
        task = list[index_];
        task.isDone = true; //Actualiza la tarea concreta
        list[index_].isDone == true; //Actualiza la lista dentro de la tarea
        emit readATask(task);
    }

    // Function to read all tasks of the list
    function readList() public {
        // emit readTheList(list);
        for(uint256 i = 0; i < list.length; i++) {
            emit readATask(list[i]);
        }
    }
}