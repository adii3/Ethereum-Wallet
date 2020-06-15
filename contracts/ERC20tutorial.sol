pragma solidity ^0.5.16;
import "./ERC20interface.sol";

contract ERC20tutorialhelper is ERCInterface {

    uint256 private _totalSupply;

    mapping(address => uint256) private _balances;

    mapping(address => mapping( address => uint256)) private _allowances;

    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20  = mint to zero address");

        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0),account, amount);
    }

    function totalSupply()public view returns (uint256){
        return _totalSupply;
    }
    function balanceOf(address account)public view returns (uint256){
        return _balances[account];
    }

    function transfer(address to, uint256 amount)public returns (bool){
        if (_balances[msg.sender] >= amount && amount>0 ) {
            _balances[msg.sender] -= amount;
            _balances[to] += amount;

            emit Transfer(msg.sender, to, amount);
            return true;
        } else {
            return false;
        }
    }

    function transferFrom(address from, address to, uint256 amount)public returns (bool){
        if (_balances[from] >= amount && amount > 0 && _allowances[from][msg.sender] >= amount){
            _balances[from] -= amount;
            _balances[to] += amount;

            _allowances[from][msg.sender] -= amount;
            emit Transfer(from, to, amount);
            return true;
        }else {
            return false;
        }
    }

    function allowance(address owner, address spender) public view returns (uint256){
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount)public returns (bool){
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
}

contract ERC20Tutorial is ERC20tutorialhelper{
    string public name = "ERC20tutoial";
    string public symbol = "tt";
    uint8 public decimal = 2;

    uint256 public initialsupply = 12000;

    constructor ()public {
        _mint(msg.sender, initialsupply);
    }
}