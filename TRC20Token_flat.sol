// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Flattened by TronIDE from flattened/TRC20Token_flat.sol. Imports inlined in dependency order.

// File: flattened/TRC20Token_flat.sol
// Flattened by TronIDE from flattened/TRC20Token_flat.sol. Imports inlined in dependency order.

// File: flattened/TRC20Token_flat.sol
// Flattened by TronIDE from flattened/TRC20Token_flat.sol. Imports inlined in dependency order.

// File: flattened/TRC20Token_flat.sol
// Flattened by TronIDE from flattened/TRC20Token_flat.sol. Imports inlined in dependency order.

// File: flattened/TRC20Token_flat.sol
// Flattened by TronIDE from contracts/TRC20Token.sol. Imports inlined in dependency order.

// File: contracts/TRC20Token.sol
/// @title TRC20 token with owner-gated mint and holder burn.
/// @notice Self-contained OpenZeppelin-style implementation - no imports,
/// so it compiles in the browser and flattens/verifies on TronScan as-is.
contract TRC20Token {
    string public name;
    string public symbol;
    uint8 public constant decimals = 6;
    uint256 public totalSupply;
    address public owner;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed holder, address indexed spender, uint256 value);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    modifier onlyOwner() {
        require(msg.sender == owner, "TRC20: caller is not the owner");
        _;
    }

    constructor(string memory name_, string memory symbol_, uint256 initialSupply) {
        name = name_;
        symbol = symbol_;
        owner = msg.sender;
        _mint(msg.sender, initialSupply);
    }

    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        uint256 allowed = allowance[from][msg.sender];
        require(allowed >= value, "TRC20: insufficient allowance");
        if (allowed != type(uint256).max) {
            allowance[from][msg.sender] = allowed - value;
        }
        _transfer(from, to, value);
        return true;
    }

    function mint(address to, uint256 value) public onlyOwner {
        _mint(to, value);
    }

    function burn(uint256 value) public {
        require(balanceOf[msg.sender] >= value, "TRC20: burn exceeds balance");
        balanceOf[msg.sender] -= value;
        totalSupply -= value;
        emit Transfer(msg.sender, address(0), value);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "TRC20: new owner is the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0), "TRC20: transfer to the zero address");
        require(balanceOf[from] >= value, "TRC20: transfer exceeds balance");
        balanceOf[from] -= value;
        balanceOf[to] += value;
        emit Transfer(from, to, value);
    }

    function _mint(address to, uint256 value) internal {
        require(to != address(0), "TRC20: mint to the zero address");
        totalSupply += value;
        balanceOf[to] += value;
        emit Transfer(address(0), to, value);
    }
}
