// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";



contract ERC20Token is ERC20, Ownable{

    //events
   event TokenGenerated(address,uint256);
   
   constructor() ERC20("ERC20Token", "ERT") Ownable(msg.sender){}

   //Generate Token
   function mint(address name, uint256 supply) public {
    _mint(name, supply);
    emit TokenGenerated(name, supply);
   }

}