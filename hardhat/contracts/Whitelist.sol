//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    //max number of white adreeses allowed
    uint8 public maxWhitelistedAddresses;

    //create a maaping of whitelist addresses allowed
    // if an address is whitelisted, we would ddddddset it to true (Its is false by default for all other addresses)
    mapping(address => bool) public whitelistedAddresses;

    //numaddressesWhitelisted would be used to keep track of how many addresses have been whitelisted.
    uint8 public numAddressesWhitelisted;

    // setting the max number of whitelisted addresses
    // User will inout the value at the time of input

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**addadressesToWhitelist - this function add the addresses of the sendder to the whitelist */

    function addAdressTOWhitelist() public {
        //check if the user has already been added
        require(
            !whitelistedAddresses[msg.sender],
            "sender already have been whitelisted"
        );
        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "More addresses cant be added, limit reached"
        );
        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}
