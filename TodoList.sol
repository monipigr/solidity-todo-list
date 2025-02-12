// SPDX-License-Identifier: LGPL-3.0-only

//Version
pragma solidity ^0.8.24;

contract TodoList {

    // Variables 
    struct Task { 
        string title;
        string description; 
        bool isDone; 
        bool isDeleted;
        address owner;
    }
    Task public task;

    Task[] public list;
    mapping(address => uint[]) taskOwner; 

    // Modifiers
    modifier checkListLength(uint256 index) {
        if (index > list.length -1 ) revert("Index not existing on the list");
        _;
    }

    // Events
    event taskCreated(string title, string description, bool isDone, bool isDeleted);
    // Read a task
    event readATask(Task task);
    // Read the list
    event readTheList(Task list);


    // External Functions
    // Function to create a new task and add to the list
    function createTask(string memory title_, string memory description_, bool isDone_) public {
        task = Task(title_, description_, isDone_, false, msg.sender);
        list.push(task); // Adds the task into the tasks list
        taskOwner[msg.sender].push(list.length - 1); // Save the index into the mapping
        emit taskCreated(title_, description_, isDone_, false);
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
        for(uint256 i = 0; i < list.length; i++) {
            emit readATask(list[i]);
        }
    }

    // Function to delete a task only if you are the owner of it
    function markTaskAsDeleted(uint256 index_) checkListLength(index_) public {
        require(msg.sender == list[index_].owner, "You cannot delete because you are not the owner of this task"); 
        require(list[index_].isDeleted == false, "This task is already deleted");
        task = list[index_];
        task.isDeleted = true;
        list[index_].isDeleted = true;
        emit readATask(task);
    }

    // Function to filter only the tasks you own. 
    function filterByAdress() public {
        require(list.length > 0);

        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].owner == msg.sender) {
                emit readATask(list[i]);            
            }
        }
    }

    // Function to count tasks owned by an user
    function getUserTasks() public view returns(uint256) {
        return taskOwner[msg.sender].length;
    }

    // Function to count all completed tasks
    function countCompletedTasks() public view returns(uint256) {
        uint256 completedTask_ = 0;
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].isDone == true) completedTask_++; 
        }
        return completedTask_;
    }
}