// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {TokenFactoryERC20} from "../src/TokenFactoryERC20.sol";

contract TokenFactoryERC20Script is Script {
    TokenFactoryERC20 public tokenFactoryERC20;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        tokenFactoryERC20 = new TokenFactoryERC20(1 wei);

        vm.stopBroadcast();
    }
}
