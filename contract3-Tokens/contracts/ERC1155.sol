// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC1155Token is ERC1155, Ownable {

    uint256 public constant GOLD = 1;
    uint256 public constant SILVER = 2;
    uint256 public constant SWORD = 3;

    constructor()  ERC1155("https://myapi.com/api/item/{id}.json") Ownable(msg.sender){
        _mint(msg.sender, GOLD, 1000*10**18, ""); //1000 gold
        _mint(msg.sender, SILVER, 500*10**18, ""); // 500 silver
        _mint(msg.sender, SWORD, 1, "");     //1 unique sword
    }



    //mint new token
    function mintToken(address account, uint id, uint amount) public onlyOwner {
           _mint(account, id, amount, "");
    }


    /// Burn tokens
    function burn(address account, uint256 id, uint256 value) public {
        require(
            account == msg.sender || isApprovedForAll(account, msg.sender),
            "Not owner nor approved"
        );
        _burn(account, id, value);
    }

}