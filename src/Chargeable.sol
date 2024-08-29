// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract Chargeable {
    uint256 private fee;

    constructor(uint256 _fee) {
        fee = _fee;
    }

    function canSetFee() internal view virtual returns (bool);

    modifier onlyIfCanSetFee() {
        require(canSetFee(), "Not allowed to set fee");
        _;
    }

    modifier requiresFeePaid() {
        require(msg.value >= fee, "Insufficient Ether sent.");
        _;
    }

    function setFee(uint256 _newFee) external onlyIfCanSetFee {
        fee = _newFee;
    }
}
