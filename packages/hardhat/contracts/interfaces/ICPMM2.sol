pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

interface ICPMM2 {
    function _transferNFT(address from, address to) external payable;

    function _depositNFT(uint256[] memory _nftIDs, uint256 _coinValue)
        external
        payable;

    function _withdrawNFT(uint256[] memory _nftIDs, uint256 _coinValue)
        external
        payable;

    function initPool(
        address _nftToken,
        address _coinToken,
        uint256[] memory _nftIDs,
        uint256 _coinValue
    ) external payable;

    function getK() external view returns (uint256);

    function getEstimateY(uint256[] memory _nftIDs)
        external
        view
        returns (uint256);
}
