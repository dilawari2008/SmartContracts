// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public simpleStorages;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorages.push(simpleStorage);
    }


    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address
        // ABI - Application Binary Interface
        SimpleStorage simpleStorage = simpleStorages[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet (uint256 _simpleStorageIndex) public view returns (uint256) {
        SimpleStorage simpleStorage = simpleStorages[_simpleStorageIndex];
        return simpleStorage.retrieve();
    }
}