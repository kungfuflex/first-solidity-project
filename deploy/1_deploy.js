const hre = require('hardhat');

module.exports = async () => {
  const [ signer ] = await hre.ethers.getSigners();
  const contract = await hre.deployments.deploy('SimpleContract', {
    contractName: 'SimpleContract',
    args: [],
    from: await signer.getAddress(),
    libraries: {}
  });
  console.log('deployed to ' + contract.address);
};

