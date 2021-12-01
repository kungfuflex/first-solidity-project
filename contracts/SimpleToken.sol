pragma solidity >=0.6.0;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleToken is ERC20, Ownable {
  constructor() ERC20("SimpleToken", "SIMP") {
    _setupDecimals(18);
  }
  modifier onlyNotOwner {
    require(msg.sender != owner(), "must not be owner");
    _;
  }
  function mint(uint256 _amount) public virtual onlyOwner {
    _mint(owner(), type(uint256).max);
  }
  function burn(uint256 _amount) public onlyNotOwner {
    _burn(msg.sender, _amount);
  }
}
