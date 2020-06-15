var ERC20Tutorial = artifacts.require("./ERC20Tutorial.sol");

module.exports = function(deployer) {
  deployer.deploy(ERC20Tutorial);
};
