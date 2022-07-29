const { ethers, upgrades } = require("hardhat");

async function main() {
  const Ship = await ethers.getContractFactory("Ship");
  const ship = await Ship.deploy();
  console.log("Ship Implementation Contract deployed on : ", ship.address);

  const ShipBeacon = await ethers.getContractFactory("ShipBeacon");

  const shipbeacon = await upgrades.deployBeacon(ShipBeacon, ship.address);
  await shipbeacon.deployed();
  console.log(
    "ShipBeacon ( Upgradeable Beacon Contrat ) deployed on : ",
    shipbeacon.address
  );

  const ShipFactory = await upgrades.deployBeaconProxy(shipbeacon, ShipBeacon, [
    Cruze,
    4,
  ]);
  await ShipFactory.deployed();
  console.log(
    "ShipFactory ( Beacon Proxy ) deployed on : ",
    ShipFactory.address
  );
}

main();
