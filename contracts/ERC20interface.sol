pragma solidity ^0.5.16;

interface ERCInterface {

    function totalSupply() external view returns(uint256 total);
    function balanceOf(address owner)external view returns (uint256 balance);
    function transfer(address to, uint256 amount) external returns (bool success);
    function transferFrom(address from, address to, uint256 amount) external returns (bool success);
    function allowance(address owner, address spender) external view returns(uint256 remaining);
    function approve(address spender, uint256 amount)external returns(bool success);

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint256 amount);
}