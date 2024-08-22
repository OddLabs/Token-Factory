// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {TokenFactory} from "../src/TokenFactory.sol";

contract TokenFactoryScript is Script {
    TokenFactory public tokenFactory;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        tokenFactory = new TokenFactory(1 wei);

        vm.stopBroadcast();
    }
}
