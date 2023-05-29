// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract SimpleContract {
  uint256 public simpleVariable;
  function setSimpleVariable(uint256 _simpleVariable) public {
    simpleVariable = _simpleVariable;
  }
}
