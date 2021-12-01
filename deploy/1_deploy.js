const hre = require('hardhat');

module.exports = async () => {
  const contract = await hre.deployments.deploy('SimpleContract', {
    contractName: 'SimpleContract',
    args: [],
    libraries: {}
  });
  console.log('deployed to ' + contract.address);
};

