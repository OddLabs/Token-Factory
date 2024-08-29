// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TokenFactoryERC20} from "../src/TokenFactoryERC20.sol";
import {TokenFactory} from "../src/TokenFactory.sol";
import {TokenERC20} from "../src/TokenERC20.sol";

contract TokenFactoryERC20Test is Test {
    TokenFactoryERC20 public tokenFactoryERC20;
    uint256 INITIAL_FEE = 100 wei;
    string DEFAULT_TOKEN_NAME = "Token";
    string DEFAULT_TOKEN_SYMBOL = "TKN";
    uint256 DEFAULT_INITIAL_SUPPLY = 1000000;

    function setUp() public {
        tokenFactoryERC20 = new TokenFactoryERC20(INITIAL_FEE);
    }

    function test_TokenCreation() public {
        // Create and impersionate client
        address client = vm.randomAddress();
        uint256 feeAmount = INITIAL_FEE;

        vm.deal(client, 1 ether);

        vm.startPrank(client);

        vm.expectEmit(true, false, true, false);
        emit TokenFactory.TokenCreated(address(client), address(1), "ERC20");
        address tokenAddress = tokenFactoryERC20.createToken{value: feeAmount}(
            DEFAULT_TOKEN_NAME, DEFAULT_TOKEN_SYMBOL, DEFAULT_INITIAL_SUPPLY
        );

        vm.stopPrank();

        // Retrieve and check created Token
        TokenERC20 createdToken = TokenERC20(tokenAddress);

        assertEq(createdToken.name(), DEFAULT_TOKEN_NAME);
        assertEq(createdToken.symbol(), DEFAULT_TOKEN_SYMBOL);
        assertEq(createdToken.totalSupply(), DEFAULT_INITIAL_SUPPLY);
        assertEq(createdToken.owner(), client);
    }
}
