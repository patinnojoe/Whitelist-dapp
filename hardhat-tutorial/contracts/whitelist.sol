//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// create the whitelist contract

contract Whitelist{
    // number of allowed address in the whitelist
    uint8 public maxWhiteListedAddresses;

    // create a variable for the number of address whitelisted
    uint8 public numofWhitelistedAddress;

    // create a map of addres with a bolean value, set it to a public variable called whitelistedaddress
    // by default each address is set to false 
    mapping(address => bool) public whiteListedAddress;
    
    // craete a constructor to set the value of maxlistedAddressees
    constructor ( uint8 _maxWhiteListedAddresses){
     maxWhiteListedAddresses  = _maxWhiteListedAddresses;
    }

    // craete a function to add addresses
    function addAddressToWhitelist() public{
        // check if address is already in whitelist
        // check if whitelistedaddress is true, if it, then the address has already been added, if it is false proceed to add the address
        require(!whiteListedAddress[msg.sender], 'addres already added to whitelist');
        // check if number of whitelisted address exceeds 
        require(numofWhitelistedAddress < maxWhiteListedAddresses, 'exceed the number of allowed whitelisted addresses');
        // set the address to true
        whiteListedAddress[msg.sender] = true;
        // increment the number of whitelisted address
        numofWhitelistedAddress +=1;

    }
}