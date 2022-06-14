// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    event Minted(
        address nftContract,
        uint256 tokenId,
        string tokenUri,
        address creator,
        uint256 price,
        string category
    );

    constructor() ERC721("BMXarto", "BMX") {}

    function mintNFT(
        string memory tokenURI,
        uint256 price,
        string memory category
    ) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        emit Minted(
            address(this),
            newItemId,
            tokenURI,
            msg.sender,
            price,
            category
        );
        return newItemId;
    }
}
