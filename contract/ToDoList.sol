pragma solidity ^0.4.11;

contract ToDoList {
  address public owner;
  mapping (uint=>string) private todoList;
  uint private itemsInList;

  function ToDoList() {
    owner = msg.sender;
    itemsInList = 0;
  }


  function addItem(uint position, string data)  external{
    todoList[position] = data;
    itemsInList++;
  }

  function deleteItem(uint position) external {
      todoList[position] = "";
  }

  function editItem(uint position, string newData)  external{
        todoList[position] = newData;
  }

  function getItemAtPos(uint position) public view returns (string item){
        return todoList[position];
  }

  function getItemsInList() public view returns (uint itemCount) {
        return itemsInList;
  }
}
