// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TokenFactory} from "../src/TokenFactory.sol";
import {Token} from "../src/Token.sol";

contract CounterTest is Test {
    TokenFactory public tokenFactory;
    uint256 INITIAL_FEE = 100 wei;
    string DEFAULT_TOKEN_NAME = "Token";
    string DEFAULT_TOKEN_SYMBOL = "TKN";
    uint256 DEFAULT_INITIAL_SUPPLY = 1000000;

    function setUp() public {
        tokenFactory = new TokenFactory(INITIAL_FEE);
    }

    function test_TokenCreation() public {
        // Create and impersionate client
        address client = vm.randomAddress();
        vm.deal(client, 1 ether);

        vm.startPrank(client);

        vm.expectEmit(true, false, false, false);
        emit TokenFactory.TokenCreated(address(client), address(1));
        address tokenAddress =
            tokenFactory.createToken(DEFAULT_TOKEN_NAME, DEFAULT_TOKEN_SYMBOL, DEFAULT_INITIAL_SUPPLY);

        vm.stopPrank();

        // Retrieve and check created Token
        Token createdToken = Token(tokenAddress);

        assertEq(createdToken.name(), DEFAULT_TOKEN_NAME);
        assertEq(createdToken.symbol(), DEFAULT_TOKEN_SYMBOL);
        assertEq(createdToken.totalSupply(), DEFAULT_INITIAL_SUPPLY);
        assertEq(createdToken.owner(), client);
    }
}
