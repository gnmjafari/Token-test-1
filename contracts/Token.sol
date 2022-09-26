// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import './ERC20.sol';

contract Jafari is ERC20
{
    constructor() ERC20 ('Jafari' , 'AJ' , 100000000 * 1e5 , 5)
    {
        _balances[_msgSender()] = 100000000 * 1e5;
    }
   
}