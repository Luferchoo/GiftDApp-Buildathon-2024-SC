// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// GiftNFT: ERC721 Token for commemorative token
contract GiftNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIds;

    constructor() ERC721("GiftNFT", "GNFT") Ownable(msg.sender) {
    }

    function mintNFT(address recipient, string memory tokenURI)
        external
        returns (uint256)
    {
        _tokenIds++;
        uint256 newItemId = _tokenIds;
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
