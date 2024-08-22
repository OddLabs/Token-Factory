// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Token} from "./Token.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract TokenFactory is Ownable {

    uint256 private fee;

    constructor(uint256 _initialFee) Ownable(msg.sender) {
        fee = _initialFee;
    }
    
    function setFee(uint256 _newFee) public onlyOwner {
        fee = _newFee;
    }

    event TokenCreated(address indexed creator, address tokenAddress);

    function createToken(string memory _name, string memory _symbol, uint256 _initialSupply) public payable returns (address) {
        Token token = new Token(_name, _symbol, _initialSupply, msg.sender);

        emit TokenCreated(msg.sender, address(token));

        return address(token);
    }
}