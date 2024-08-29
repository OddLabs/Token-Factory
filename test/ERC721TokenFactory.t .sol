// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TokenFactoryERC721} from "../src/TokenFactoryERC721.sol";
import {TokenFactory} from "../src/TokenFactory.sol";
import {TokenERC721} from "../src/TokenERC721.sol";

contract TokenFactoryERC721Test is Test {
    TokenFactoryERC721 public tokenFactoryERC721;
    uint256 INITIAL_FEE = 100 wei;
    string DEFAULT_TOKEN_NAME = "Token";
    string DEFAULT_TOKEN_SYMBOL = "TKN";
    uint256 DEFAULT_INITIAL_SUPPLY = 1000000;

    function setUp() public {
        tokenFactoryERC721 = new TokenFactoryERC721(INITIAL_FEE);
    }

    function test_TokenCreation() public {
        // Create and impersionate client
        address client = vm.randomAddress();
        uint256 feeAmount = INITIAL_FEE;

        vm.deal(client, 1 ether);

        vm.startPrank(client);

        vm.expectEmit(true, false, true, false);
        emit TokenFactory.TokenCreated(address(client), address(1), "ERC20");
        address tokenAddress = tokenFactoryERC721.createToken{value: feeAmount}(
            DEFAULT_TOKEN_NAME, DEFAULT_TOKEN_SYMBOL
        );

        vm.stopPrank();

        // Retrieve and check created Token
        TokenERC721 createdToken = TokenERC721(tokenAddress);

        assertEq(createdToken.name(), DEFAULT_TOKEN_NAME);
        assertEq(createdToken.symbol(), DEFAULT_TOKEN_SYMBOL);
        assertEq(createdToken.owner(), client);
    }
}
