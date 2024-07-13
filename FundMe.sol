// Get funds from user
// Withdraw funds
// Set minimum value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

error NotOwner();

// constant and immutable keywords
// instead of saving it in the storage slot
// these variables store the values directly in the bytecode of the contract

contract FundMe {
    using PriceConverter for uint256;

    // before using constant - 844388
    // after using constant - 824418
    // approx 20K - as much gas used to send eth
    uint256 public constant MINIMUM_USD = 2 * 1e18; // 2 dollars
    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;
    address public immutable i_owner;

    constructor () {
        i_owner = msg.sender;
    }
    // smart contracts can hold funds just like ethereum just like a wallet they too have an address
    function fund() public payable  {
        // set a min fund amt in USD

        // 1. how to send ETH to this contract
        // msg.value is in eth not wei
        // msg.value is the first arg, successive args will be 2nd , 3rd ...
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough");
        // 2nd arg is reverting action, which means undo any action which occurred

        // 18 decimals - for 1 wei = 1e-18 eth
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;

    }

    function withdraw() public onlyOwner {
        
        // set map to 0
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex += 1) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // set array to 0
        funders = new address[](0); // 0 indicates the length of the array

        // msg.sender -> address
        // withdraw funds
        // transfer
        // payable(msg.sender).transfer(address(this).balance);
        // send
        // bool isSendSuccess = payable(msg.sender).send(address(this).balance);
        // require(isSendSuccess, "Send Failed");
        // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner {
        // require(msg.sender == i_owner, "Sender is not known");
        if (msg.sender != i_owner) revert NotOwner();
        _;
    }

    // Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \ 
    //         yes  no
    //         /     \
    //    receive()?  fallback() 
    //     /   \ 
    //   yes   no
    //  /        \
    //receive()  fallback()

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }
}