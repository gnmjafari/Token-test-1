// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Context.sol';
import './SafeMath.sol';
import './IERC20.sol';
import './Ownable.sol';

contract ERC20 is IERC20 , Context , Ownable 
{
    using SafeMath for uint256;
    
    string private _name;
    string private _symbol;
    uint private _totalsupply;
    uint private _decimals;

    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) _allowances;

    constructor (string memory name_ , string memory symbol_ , uint totalsupply_ , uint decimals_)
    {
        _name = name_;
        _symbol = symbol_;
        _totalsupply = totalsupply_;
        _decimals = decimals_;
    }

    function name()public view virtual returns(string memory)
    {
        return _name;
    }

    function symbol() public view virtual returns(string memory)
    {
        return _symbol;
    }

    function decimals() public view virtual returns(uint256)
    {
        return _decimals;
    }

    function totalsupply() public view virtual override returns(uint256)
    {
        return _totalsupply;
    }
 
    function balanceOf(address account) public view virtual override returns(uint256)
    {
        return _balances[account];
    }


    function _transfer(address from , address to , uint256 amount)internal virtual
    {
        require(from != address(0) && to != address(0) , "ERC20 : zero addres");
        uint256 frombalance = _balances[from];
        require(frombalance >= amount);

        _balances[from] = _balances[from] .sub(amount);
        _balances[to] = _balances[to].add(amount);

        emit Transfer(from, to, amount);
    }

    function _approve(address owner , address spender , uint256 amount)internal virtual
    {
        require(owner != address(0) && spender != address(0) , "ERC20 : zero address");
        _allowances[owner][spender] = amount;

        emit Approval(owner, spender, amount);
    }

    function transfer (address to , uint256 amount) public virtual override returns(bool)
    {
        address from = _msgSender();
        _transfer(from, to, amount);

        return true;
    }

    function allowance (address owner , address spender)public view virtual override returns(uint256)
    {
        return _allowances[owner][spender];
    }

    function transferFrom (address from , address to , uint256 amount)public virtual override returns(bool)
    {
        address spender = _msgSender();
        require(amount <= _allowances[from][spender] , " balance not enaf");
        _allowances[from][spender] = _allowances[from][spender].sub(amount);
        _transfer(from, to, amount);

        return true;
    }

    function approve (address spender , uint256 amount)public virtual override returns(bool)
    {
        address owner = _msgSender();
        _approve(owner, spender, amount);

        return true;
    }
}