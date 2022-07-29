//SPDX-License-Identifier:MIT

// 1. Implementation Contract

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

pragma solidity ^0.8.10;

contract Ship is Initializable{
    string public name;
    uint256 public fuel;
    function initialize(string memory _name,uint256 _fuel) public initializer{
        name=_name;
        fuel=_fuel;
    }
    function sail() public{
        require(fuel>0,"No Fuel!");
        fuel--;
    }
}