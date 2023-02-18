const { ethers } = require("hardhat");

async function main() {
  /**
   * A contractFactory is ethers.js is an abstraction used to deploy new smart contracts
   * so whitelistContract here is a factory for in stances of our whitelist contract
   */
  const whitelistContract = await ethers.getContractFactory("Whitelist");
  // here we deploy the contract
  const deployedWhitelistContract = await whitelistContract.deploy(10);
  // 10 is the maximum number of white listed addresses

  // wait for it to finish deploying

  await deployedWhitelistContract.deployed();

  //print the address of the deployed contract

  console.log("Whitelist contract address:", deployedWhitelistContract.address);
}

//call the main function

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    procees.exit(1);
  });
