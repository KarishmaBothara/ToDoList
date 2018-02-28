pragma solidity ^0.4.11;

contract ToDoList {
  mapping (address => mapping (uint => string)) private todoList; //mapping of addresses to mapping of position and data
  address public owner;
 // mapping (uint=>string) private todoList;
  mapping (address => uint) ownerListCount; // mapping of address to #noOfItemInList

  function ToDoList() {
    owner = msg.sender;
  }


  function addItem(string data)  external{
    uint currentPos = ownerListCount[msg.sender];
    currentPos = currentPos + 1;
    todoList[msg.sender][currentPos] = data;
    ownerListCount[msg.sender] = currentPos;
  }

  function deleteItem(uint position) external {
      todoList[msg.sender][position] = "";
  }

  function editItem(uint position, string newData)  external{
        todoList[msg.sender][position] = newData;
  }

  function getItemAtPos(uint position) public view returns (string item){
        return todoList[msg.sender][position];
  }

  function getItemsInList() public view returns (uint itemCount) {
        return ownerListCount[msg.sender];
  }
}
