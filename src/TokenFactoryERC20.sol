// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {TokenERC20} from "./TokenERC20.sol";
import {Chargeable} from "./Chargeable.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import {TokenFactory} from "./TokenFactory.sol";

contract TokenFactoryERC20 is TokenFactory {
    constructor(uint256 _fee) TokenFactory(_fee, msg.sender) {}

    function createToken(string memory _name, string memory _symbol, uint256 _initialSupply)
        external
        payable
        requiresFeePaid
        returns (address)
    {
        TokenERC20 tokenERC20 = new TokenERC20(_name, _symbol, _initialSupply, msg.sender);

        emit TokenCreated(msg.sender, address(tokenERC20), "ERC20");

        return address(tokenERC20);
    }
}
