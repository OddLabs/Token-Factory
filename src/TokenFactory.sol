// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import {Chargeable} from "./Chargeable.sol";

abstract contract TokenFactory is Ownable, Chargeable {
    constructor(uint256 _fee, address _initialOwner) Ownable(msg.sender) Chargeable(_fee) {}

    event TokenCreated(address indexed creator, address tokenAddress, string tokenKind);

    function canSetFee() internal view override returns (bool) {
        return msg.sender == owner();
    }
}
