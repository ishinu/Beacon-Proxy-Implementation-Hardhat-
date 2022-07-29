//SPDX-License-Identifier:MIT

// 2. Beacon Proxy

import "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";

import "./ShipBeacon.sol";
import "./Ship.sol";

pragma solidity ^0.8.10;

contract ShipFactory is BeaconProxy{
    ShipBeacon immutable beacon;
    mapping(uint32=>address) internal ships;
    constructor(address impl){
        beacon = new ShipBeacon(impl);
    }
    BeaconProxy proxy = new BeaconProxy(address(beacon),
        abi.encodeWithSelector(Ship(address(0)).initialize.selector,_name,_fuel));
    // function buildShip(string calldata _name,uint32 shipId,uint256 _fuel) external returns(address){
        
    //     ships[shipId] = address(proxy);
    //     return address(proxy);
    // }
    function getShipAddress(uint32 shipId) external view returns(address){
        return ships[shipId];
    }
    function getBeacon() public view returns(address){
        return address(beacon);
    }
    function getImplementation() public view returns(address){
        return beacon.implementation();
    }
}