pragma solidity >=0.8.0 <0.9.0;

//SPDX-License-Identifier: MIT

interface ICPMM2Callee {
    function cpmm2Call(
        address sender,
        uint256 amount0,
        uint256 amount1,
        bytes calldata data
    ) external;
}
