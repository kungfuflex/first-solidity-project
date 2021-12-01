pragma solidity ^0.6.0;

contract SimpleContract {
  uint256 public simpleVariable;
  function setSimpleVariable(uint256 _simpleVariable) public {
    simpleVariable = _simpleVariable;
  }
}
