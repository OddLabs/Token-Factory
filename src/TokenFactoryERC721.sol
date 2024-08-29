// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TokenERC721} from "./TokenERC721.sol";
import {Chargeable} from "./Chargeable.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import {TokenFactory} from "./TokenFactory.sol";

contract TokenFactoryERC721 is TokenFactory {
    constructor(uint256 _fee) TokenFactory(_fee, msg.sender) {}

    function createToken(string memory _name, string memory _symbol)
        external
        payable
        requiresFeePaid
        returns (address)
    {
        TokenERC721 tokenERC721 = new TokenERC721(_name, _symbol, msg.sender);

        emit TokenCreated(msg.sender, address(tokenERC721), "ERC721");

        return address(tokenERC721);
    }
}
