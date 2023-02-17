// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract MUSD is ERC20{    
    constructor()
    ERC20("MockUSD","MUSD") {
        _mint(msg.sender,1e26);
    }

}