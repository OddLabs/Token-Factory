// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract TokenERC20 is ERC20, Ownable {
    constructor(string memory _name, string memory _symbol, uint256 _initialSupply, address _initialOwner)
        ERC20(_name, _symbol)
        Ownable(_initialOwner)
    {
        _mint(_initialOwner, _initialSupply);
    }
}
