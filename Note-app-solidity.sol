// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Notepad {
    mapping(address => string[]) private notes;

    function addNote(string memory _note) public {
        notes[msg.sender].push(_note);
    }

    function getNotes() public view returns (string[] memory) {
        return notes[msg.sender];
    }

    function deleteNote(uint index) public {
        require(index < notes[msg.sender].length, "Index out of bounds");
        for (uint i = index; i < notes[msg.sender].length - 1; i++) {
            notes[msg.sender][i] = notes[msg.sender][i + 1];
        }
        notes[msg.sender].pop();
    }
}
