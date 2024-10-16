// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public manager;
    address[] public players;
    
    constructor() {
        manager = msg.sender;
    }
    
    function enter() public payable {
        require(msg.value > 0.01 ether, "Minimum Ether not sent");
        players.push(msg.sender);
    }
    
   function pickWinner() public restricted returns (address) {
    require(players.length > 0, "No players in the lottery");

    uint index = random() % players.length;
    address winner = players[index];

    payable(winner).transfer(address(this).balance);
    delete players;  // Reset players array
    
    return winner;   // Return the winner's address
}

    
   function random() private view returns (uint) {
    return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
}

    
    modifier restricted() {
        require(msg.sender == manager, "You are not the manager");
        _;
    }
    
    function getPlayers() public view returns (address[] memory) {
        return players;
    }

}
