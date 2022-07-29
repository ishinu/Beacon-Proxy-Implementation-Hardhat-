//SPDX-License-Identifier:MIT

// 3. Upgradeable beacon.

import "@openzeppelin/contracts/proxy/beacon/UpgradeableBeacon.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

pragma solidity ^0.8.10;

contract ShipBeacon is UpgradeableBeacon{
    UpgradeableBeacon immutable beacon;
    address public blueprint;

    constructor(address _initBlueprint){
        beacon = new UpgradeableBeacon(_initBlueprint);
        blueprint = _initBlueprint;
        transferOwnership(tx.origin);
    }
    function implementation() public view virtual override returns(address){
        return blueprint;
    }
    function update(address _newBlueprint) public onlyOwner{
        beacon.upgradeTo(_newBlueprint);
        blueprint = _newBlueprint;
    }
}