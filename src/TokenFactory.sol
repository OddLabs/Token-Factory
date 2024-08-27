// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Token} from "./Token.sol";
import {Chargeable} from "./Chargeable.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract TokenFactory is Ownable, Chargeable {
    event TokenCreated(address indexed creator, address tokenAddress);

    constructor(uint256 _fee) Ownable(msg.sender) Chargeable(_fee) {}

    function canSetFee() internal view override returns (bool) {
        return msg.sender == owner();
    }

    function createToken(string memory _name, string memory _symbol, uint256 _initialSupply)
        public
        payable
        returns (address)
    {
        Token token = new Token(_name, _symbol, _initialSupply, msg.sender);

        emit TokenCreated(msg.sender, address(token));

        return address(token);
    }
}
