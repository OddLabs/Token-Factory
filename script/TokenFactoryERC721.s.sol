// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {TokenFactoryERC721} from "../src/TokenFactoryERC721.sol";

contract TokenFactoryERC721Script is Script {
    TokenFactoryERC721 public tokenFactoryERC721;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        tokenFactoryERC721 = new TokenFactoryERC721(1 wei);

        vm.stopBroadcast();
    }
}
