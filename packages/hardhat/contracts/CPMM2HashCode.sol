pragma solidity >=0.8.0 <0.9.0;

//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

import "./CPMM2.sol";

contract CPMM2HashCode {
    function getHashCode() public pure returns (bytes memory bytecode) {
        bytecode = type(CPMM2).creationCode;
        return bytecode;
    }
}
