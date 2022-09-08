// deploy/01_deploy_cpmm.js

const { ethers } = require("hardhat");

const localChainId = "31337";

// const sleep = (ms) =>
//   new Promise((r) =>
//     setTimeout(() => {
//       console.log(`waited for ${(ms / 1000).toFixed(3)} seconds`);
//       r();
//     }, ms)
//   );

module.exports = async ({ getNamedAccounts, deployments, getChainId }) => {
  const { deploy } = deployments;
  const { deployer, admin } = await getNamedAccounts();
  const chainId = await getChainId();

  await deploy("CPMM2", {
    // Learn more about args here: https://www.npmjs.com/package/hardhat-deploy#deploymentsdeploy
    from: deployer,
    // args: [],
    log: true,
    waitConfirmations: 5,
  });

  // Getting a previously deployed contract
  const CPMM2 = await ethers.getContract("CPMM2", deployer);
  await CPMM2.transferOwnership(admin);

  // await CPMM2.initPool(
  //   "0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D",
  //   "0x0000000000000000000000000000000000000000",
  //   [1771, 7904, 3954],
  //   ethers.utils.parseEther("1.5")
  // );
};
module.exports.tags = ["CPMM2"];
