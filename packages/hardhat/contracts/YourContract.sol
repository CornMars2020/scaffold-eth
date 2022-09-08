pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

// import "@openzeppelin/contracts/access/Ownable.sol";
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {
    event SetPurpose(address sender, string purpose);
    event SetMessage(address sender, string message);

    string public purpose = "Building Unstoppable Apps!!!";
    string public message = "my message";

    constructor() payable {
        // what should we do on deploy?
    }

    function setPurpose(string memory newPurpose) public {
        purpose = newPurpose;
        console.log(msg.sender, "set purpose to", purpose);
        emit SetPurpose(msg.sender, purpose);
    }

    function setMessage(string memory _message) public {
        message = _message;
        console.log(msg.sender, "set message to", message);
        emit SetMessage(msg.sender, message);
    }

    // to support receiving ETH by default
    receive() external payable {}

    fallback() external payable {}
}
