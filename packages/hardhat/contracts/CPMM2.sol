pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol
import "@openzeppelin/contracts/access/Ownable.sol";

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract CPMM2 is Ownable {
    using SafeMath for uint256;

    event SetTradable(address sender);
    event InitPool(address sender, address nftToken, address coinToken);

    address public nftToken;
    address public coinToken;

    mapping(uint256 => address) public nftHolders;
    uint256 public coinValue;

    uint256 public X;
    uint256 public Y;
    uint256 public N;

    bool public isTradable = false;

    function setTradable() public onlyOwner {
        require(isTradable == false, "Market Already Tradable");

        isTradable = true;
        emit SetTradable(msg.sender);
    }

    function initPool(
        address _nftToken,
        address _coinToken,
        uint256[] memory _nftIDs,
        uint256 _coinValue
    ) public payable onlyOwner {
        require(isTradable == false, "Market Already Set");
        require(_nftIDs.length > 0, "Invalid NFT");
        require(_coinValue > 0, "Invalid Coin Value");

        nftToken = _nftToken;
        coinToken = _coinToken;

        for (uint256 i = 0; i < _nftIDs.length; i++) {
            // TODO deposit NFT to this address
            nftHolders[_nftIDs[i]] = msg.sender;
        }

        coinValue = _coinValue;

        N = _nftIDs.length;
        X = _nftIDs.length;
        Y = _coinValue;

        emit InitPool(msg.sender, _nftToken, _coinToken);
    }

    function getK() public view returns (uint256) {
        return X.mul(Y).div(N.mul(N));
    }

    function getMintEstimateY(uint256 nftAmount, uint256 nftTokenAmount)
        public
        view
        returns (uint256)
    {
        return
            getK()
                .mul((N.add(nftTokenAmount).mul(N.add(nftTokenAmount))))
                .div(X.add(nftAmount))
                .sub(Y);
    }

    // function getBurnEstimateXY() public view returns (uint256, uint256) {}

    // to support receiving ETH by default
    receive() external payable {}

    fallback() external payable {}
}
