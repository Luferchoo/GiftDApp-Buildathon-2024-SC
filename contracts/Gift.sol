// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./GiftToken.sol";
import "./GiftNFT.sol";

contract Donation is Ownable(msg.sender) {
    GiftToken public giftToken;
    GiftNFT public giftNFT;

    constructor(address giftTokenAddress, address giftNFTAddress) {
        giftToken = GiftToken(giftTokenAddress);
        giftNFT = GiftNFT(giftNFTAddress);
    }

    function donate(address recipient, string memory nftURI) external payable {
        require(msg.value > 0, "Donation amount must be greater than zero");

        // Transfer funds to recipient
        payable(recipient).transfer(msg.value);

        // Mint NFT for donor
        giftNFT.mintNFT(msg.sender, nftURI);

        // Mint GFT for donor (adjust reward logic as needed)
        uint256 rewardAmount = msg.value * 100; // Example: 100 GFT per Ether
        giftToken.mint(msg.sender, rewardAmount);
    }
}
