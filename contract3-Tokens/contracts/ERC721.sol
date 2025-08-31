// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";



contract NFT is ERC721, ERC721URIStorage , Ownable{
    uint public tokenId;
    uint256[] public allNFT;

    //events
    event NFTminted(uint);
    
    // contructor
    constructor() ERC721("NFT" , "EMP") Ownable(msg.sender){}


    //function to mint
    function _mint(string memory tokenUrl) public {
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId,tokenUrl);
        allNFT.push(tokenId);
        emit NFTminted(tokenId);
        tokenId++;
    }


    //override functions 
    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns(bool){
        return super.supportsInterface(interfaceId);
    }

    function tokenURI(uint256 _tokenId) public view override(ERC721, ERC721URIStorage) returns(string memory){
        return super.tokenURI(_tokenId);
    }
}