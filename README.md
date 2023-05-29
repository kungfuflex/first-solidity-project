# first-solidity-project

## What is Solidity?

Solidity is a programming language designed to build programs that run on the Ethereum virtual machine.

A Solidity program is called a contract. It consists of a layout of storage variables, an optional constructor function that produces additional bytecode for contract creation code, and a set of functions that are exposed to the world and can be called with the appropriate calldata sent with a user transaction or by another contract.

Solidity contracts can be developed using frameworks such as Brownie (Python) or hardhat (JavaScript)

For these demonstrations, we will use hardhat.

## Creating a hardhat project

First, create a directory with a `package.json` file to declare a JavaScript module.

You will need the package `hardhat`

The modules hardhat-deploy and hardhat-deploy-ethers are also very common nowadays

Install with

```shell

yarn add hardhat hardhat-deploy hardhat-deploy-ethers

```

Then to make it a hardhat project, place the following code in `hardhat.config.js` at the root of the project

```js

module.exports = {
  solidity: '0.8.10'
};

```

Now you can start writing contracts, placing them in the `contracts/` directory at the root of your project.

To build your contracts, you simply execute

```shell

yarn hardhat compile

```

And it will produce a directory `artifacts/` where your contract binaries will go, containing the bytecode for a deployment.

Contract artifacts also contain the `abi` property in their JSON, which contains a JSON definition of all of the contracts public functions, so you can construct objects in a JS environment that will expose methods to call the contract functions.


## A Simple Contract

From the Solidity docs at [https://docs.soliditylang.org/en/v0.8.10/introduction-to-smart-contracts.html](https://docs.soliditylang.org/en/v0.8.10/introduction-to-smart-contracts.html):

```js
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}
```

This is a contract that exposes a `set(uint256)` and `get()` function to get or set a storage variable called `storedData`.

We can build the contract as described in the previous section

```shell

yarn hardhat compile

```

To actually prove to ourselves that it works, we would want to be able to deploy the contract and then test the features.

We can do the former with `hardhat-deploy`

First, change your `hardhat.config.js` file to the following

```js
require('hardhat-deploy')
require('hardhat-deploy-ethers')

module.exports = {
  solidity: '0.8.10'
}
```

When you include `require` statements at the top of your `hardhat.config.js` it will load any hardhat module you choose into the hardhat environment.

Loading hardhat modules typically alters the object that you get in a hardhat project when you do

```js
const hre = require('hardhat'); // hre now contains the deployments property
```

To write our deployment file, we may use

```js

// deploy/1_deploy.js

const hre = require('hardhat');

module.exports = async () => {
  const deployment = await hre.deployments.deploy('SimpleContract', {
    name: 'SimpleContract',
    args: [],
    libraries: {}
  });
  console.log('SimpleContract deployed to ' + deployment.address);
};

```

Now when we run the command

```shell
yarn hardhat node

```

## Further Learning

It is useful before taking a deep dive into Ethereum smart contract programming to learn the instruction set used in the EVM.

[https://ethervm.io/](https://ethervm.io/)

Experiment with assembly and disassembly using these JS tools

[https://github.com/kungfuflex/emasm](https://github.com/kungfuflex/emasm)
[https://github.com/kungfuflex/evmdis](https://github.com/kungfuflex/evmdis)

Learn how to be productive with the @openzeppelin/contracts repository available on npm

A good description is here:

[https://github.com/kungfuflex/openzeppelin-contracts-workshop](https://github.com/kungfuflex/openzeppelin-contracts-workshop)

The entire OpenZeppelin framework is here

[https://github.com/OpenZeppelin/openzeppelin-contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)

Learn to use the OpenZeppelin upgradeable contract framework

[https://docs.openzeppelin.com/upgrades-plugins/1.x/writing-upgradeable](https://docs.openzeppelin.com/upgrades-plugins/1.x/writing-upgradeable)
[https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable)

Learn to use the OpenZeppelin factory/clone pattern

[https://medium.com/upstate-interactive/how-to-build-a-contract-factory-that-creates-contract-clones-efcc9619be0b](https://medium.com/upstate-interactive/how-to-build-a-contract-factory-that-creates-contract-clones-efcc9619be0b)

To build better UX, learn to use @uniswap/permit2-sdk

[https://github.com/Uniswap/permit2-sdk](https://github.com/Uniswap/permit2-sdk)

Check out a smart contract project that does not use Solidity, but instead uses EVM assembly via emasm

[https://github.com/pintswap](https://github.com/pintswap)
