// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleToken is ERC20, Ownable {
  constructor() ERC20("SimpleToken", "SIMP") {}
  modifier onlyNotOwner {
    require(msg.sender != owner(), "must not be owner");
    _;
  }
  function mint(uint256 _amount) public virtual onlyOwner {
    _mint(owner(), _amount);
  }
  function burn(uint256 _amount) public onlyNotOwner {
    _burn(msg.sender, _amount);
  }
}
