// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721URIStorage} from "../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract TokenERC721 is ERC721URIStorage, Ownable {
    constructor(string memory _name, string memory _symbol, address _initialOwner)
        ERC721(_name, _symbol)
        Ownable(_initialOwner)
    {}
}
