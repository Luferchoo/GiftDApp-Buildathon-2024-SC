// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// GiftToken: ERC20 Token for rewards
contract GiftToken is ERC20, Ownable(msg.sender) {
    constructor() ERC20("GiftToken", "GFT") {
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Initial supply to contract owner
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}