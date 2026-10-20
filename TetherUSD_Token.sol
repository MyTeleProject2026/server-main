{
  "tool": "TronIDE Contract Verification MVP",
  "network": "Mainnet",
  "contractAddress": "TNj5wv4bC5bYTrYWBLPmcxUPRRdx9GRVwp",
  "contractName": "TRC20Token",
  "sourceFile": "flattened/TRC20Token_flat.sol",
  "compilerVersion": "0.8.31+commit.c2812a3d.Emscripten.clang",
  "optimization": {
    "enabled": true,
    "runs": 1
  },
  "evmVersion": "osaka",
  "libraries": {},
  "standardJsonInput": {
    "language": "Solidity",
    "sources": {
      "flattened/TRC20Token_flat.sol": {
        "content": "// SPDX-License-Identifier: MIT\npragma solidity ^0.8.0;\n\n// Flattened by TronIDE from contracts/TRC20Token.sol. Imports inlined in dependency order.\n\n// File: contracts/TRC20Token.sol\n/// @title TRC20 token with owner-gated mint and holder burn.\n/// @notice Self-contained OpenZeppelin-style implementation - no imports,\n/// so it compiles in the browser and flattens/verifies on TronScan as-is.\ncontract TRC20Token {\n    string public name;\n    string public symbol;\n    uint8 public constant decimals = 6;\n    uint256 public totalSupply;\n    address public owner;\n\n    mapping(address => uint256) public balanceOf;\n    mapping(address => mapping(address => uint256)) public allowance;\n\n    event Transfer(address indexed from, address indexed to, uint256 value);\n    event Approval(address indexed holder, address indexed spender, uint256 value);\n    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);\n\n    modifier onlyOwner() {\n        require(msg.sender == owner, \"TRC20: caller is not the owner\");\n        _;\n    }\n\n    constructor(string memory name_, string memory symbol_, uint256 initialSupply) {\n        name = name_;\n        symbol = symbol_;\n        owner = msg.sender;\n        _mint(msg.sender, initialSupply);\n    }\n\n    function transfer(address to, uint256 value) public returns (bool) {\n        _transfer(msg.sender, to, value);\n        return true;\n    }\n\n    function approve(address spender, uint256 value) public returns (bool) {\n        allowance[msg.sender][spender] = value;\n        emit Approval(msg.sender, spender, value);\n        return true;\n    }\n\n    function transferFrom(address from, address to, uint256 value) public returns (bool) {\n        uint256 allowed = allowance[from][msg.sender];\n        require(allowed >= value, \"TRC20: insufficient allowance\");\n        if (allowed != type(uint256).max) {\n            allowance[from][msg.sender] = allowed - value;\n        }\n        _transfer(from, to, value);\n        return true;\n    }\n\n    function mint(address to, uint256 value) public onlyOwner {\n        _mint(to, value);\n    }\n\n    function burn(uint256 value) public {\n        require(balanceOf[msg.sender] >= value, \"TRC20: burn exceeds balance\");\n        balanceOf[msg.sender] -= value;\n        totalSupply -= value;\n        emit Transfer(msg.sender, address(0), value);\n    }\n\n    function transferOwnership(address newOwner) public onlyOwner {\n        require(newOwner != address(0), \"TRC20: new owner is the zero address\");\n        emit OwnershipTransferred(owner, newOwner);\n        owner = newOwner;\n    }\n\n    function _transfer(address from, address to, uint256 value) internal {\n        require(to != address(0), \"TRC20: transfer to the zero address\");\n        require(balanceOf[from] >= value, \"TRC20: transfer exceeds balance\");\n        balanceOf[from] -= value;\n        balanceOf[to] += value;\n        emit Transfer(from, to, value);\n    }\n\n    function _mint(address to, uint256 value) internal {\n        require(to != address(0), \"TRC20: mint to the zero address\");\n        totalSupply += value;\n        balanceOf[to] += value;\n        emit Transfer(address(0), to, value);\n    }\n}\n"
      }
    },
    "settings": {
      "compilationTarget": {
        "flattened/TRC20Token_flat.sol": "TRC20Token"
      },
      "evmVersion": "osaka",
      "libraries": {},
      "metadata": {
        "bytecodeHash": "ipfs"
      },
      "optimizer": {
        "enabled": true,
        "runs": 1
      },
      "remappings": []
    }
  },
  "abi": [
    {
      "inputs": [
        {
          "internalType": "string",
          "name": "name_",
          "type": "string"
        },
        {
          "internalType": "string",
          "name": "symbol_",
          "type": "string"
        },
        {
          "internalType": "uint256",
          "name": "initialSupply",
          "type": "uint256"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "constructor"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "holder",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "spender",
          "type": "address"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "Approval",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "previousOwner",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "newOwner",
          "type": "address"
        }
      ],
      "name": "OwnershipTransferred",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "Transfer",
      "type": "event"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "name": "allowance",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "spender",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "approve",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "name": "balanceOf",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "burn",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "decimals",
      "outputs": [
        {
          "internalType": "uint8",
          "name": "",
          "type": "uint8"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "mint",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "name",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "owner",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "symbol",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "totalSupply",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "transfer",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "transferFrom",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "newOwner",
          "type": "address"
        }
      ],
      "name": "transferOwnership",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ],
  "bytecode": "608060405234801561000f575f5ffd5b50d3801561001b575f5ffd5b50d28015610027575f5ffd5b50604051610e10380380610e1083398101604081905261004691610203565b5f61005184826102ff565b50600161005e83826102ff565b50600380546001600160a01b0319163390811790915561007e9082610086565b5050506103e2565b6001600160a01b0382166100e05760405162461bcd60e51b815260206004820152601f60248201527f54524332303a206d696e7420746f20746865207a65726f206164647265737300604482015260640160405180910390fd5b8060025f8282546100f191906103bd565b90915550506001600160a01b0382165f908152600460205260408120805483929061011d9084906103bd565b90915550506040518181526001600160a01b038316905f907fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9060200160405180910390a35050565b634e487b7160e01b5f52604160045260245ffd5b5f82601f830112610189575f5ffd5b81516001600160401b038111156101a2576101a2610166565b604051601f8201601f19908116603f011681016001600160401b03811182821017156101d0576101d0610166565b6040528181528382016020018510156101e7575f5ffd5b8160208501602083015e5f918101602001919091529392505050565b5f5f5f60608486031215610215575f5ffd5b83516001600160401b0381111561022a575f5ffd5b6102368682870161017a565b602086015190945090506001600160401b03811115610253575f5ffd5b61025f8682870161017a565b925050604084015190509250925092565b600181811c9082168061028457607f821691505b6020821081036102a257634e487b7160e01b5f52602260045260245ffd5b50919050565b601f8211156102fa57828211156102fa57805f5260205f20601f840160051c60208510156102d357505f5b90810190601f840160051c035f5b818110156102f6575f838201556001016102e1565b5050505b505050565b81516001600160401b0381111561031857610318610166565b61032c816103268454610270565b846102a8565b6020601f82116001811461035e575f83156103475750848201515b5f19600385901b1c1916600184901b1784556103b6565b5f84815260208120601f198516915b8281101561038d578785015182556020948501946001909201910161036d565b50848210156103aa57868401515f19600387901b60f8161c191681555b505060018360011b0184555b5050505050565b808201808211156103dc57634e487b7160e01b5f52601160045260245ffd5b92915050565b610a21806103ef5f395ff3fe608060405234801561000f575f5ffd5b50d3801561001b575f5ffd5b50d28015610027575f5ffd5b50600436106100c5575f3560e01c806306fdde03146100c9578063095ea7b3146100e757806318160ddd1461010a57806323b872dd14610121578063313ce5671461013457806340c10f191461014e57806342966c681461016357806370a08231146101765780638da5cb5b1461019557806395d89b41146101c0578063a9059cbb146101c8578063dd62ed3e146101db578063f2fde38b14610205575b5f5ffd5b6100d1610218565b6040516100de91906107fd565b60405180910390f35b6100fa6100f5366004610858565b6102a3565b60405190151581526020016100de565b61011360025481565b6040519081526020016100de565b6100fa61012f366004610880565b61030f565b61013c600681565b60405160ff90911681526020016100de565b61016161015c366004610858565b6103d3565b005b6101616101713660046108ba565b61040b565b6101136101843660046108d1565b60046020525f908152604090205481565b6003546101a8906001600160a01b031681565b6040516001600160a01b0390911681526020016100de565b6100d16104c9565b6100fa6101d6366004610858565b6104d6565b6101136101e93660046108f1565b600560209081525f928352604080842090915290825290205481565b6101616102133660046108d1565b6104eb565b5f805461022490610922565b80601f016020809104026020016040519081016040528092919081815260200182805461025090610922565b801561029b5780601f106102725761010080835404028352916020019161029b565b820191905f5260205f20905b81548152906001019060200180831161027e57829003601f168201915b505050505081565b335f8181526005602090815260408083206001600160a01b038716808552925280832085905551919290917f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925906102fd9086815260200190565b60405180910390a35060015b92915050565b6001600160a01b0383165f908152600560209081526040808320338452909152812054828110156103875760405162461bcd60e51b815260206004820152601d60248201527f54524332303a20696e73756666696369656e7420616c6c6f77616e636500000060448201526064015b60405180910390fd5b5f1981146103bd57610399838261096e565b6001600160a01b0386165f9081526005602090815260408083203384529091529020555b6103c88585856105d2565b506001949350505050565b6003546001600160a01b031633146103fd5760405162461bcd60e51b815260040161037e90610981565b6104078282610734565b5050565b335f908152600460205260409020548111156104675760405162461bcd60e51b815260206004820152601b60248201527a54524332303a206275726e20657863656564732062616c616e636560281b604482015260640161037e565b335f908152600460205260408120805483929061048590849061096e565b925050819055508060025f82825461049d919061096e565b90915550506040518181525f9033905f5160206109cc5f395f51905f529060200160405180910390a350565b6001805461022490610922565b5f6104e23384846105d2565b50600192915050565b6003546001600160a01b031633146105155760405162461bcd60e51b815260040161037e90610981565b6001600160a01b0381166105775760405162461bcd60e51b8152602060048201526024808201527f54524332303a206e6577206f776e657220697320746865207a65726f206164646044820152637265737360e01b606482015260840161037e565b6003546040516001600160a01b038084169216907f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0905f90a3600380546001600160a01b0319166001600160a01b0392909216919091179055565b6001600160a01b0382166106345760405162461bcd60e51b815260206004820152602360248201527f54524332303a207472616e7366657220746f20746865207a65726f206164647260448201526265737360e81b606482015260840161037e565b6001600160a01b0383165f9081526004602052604090205481111561069b5760405162461bcd60e51b815260206004820152601f60248201527f54524332303a207472616e7366657220657863656564732062616c616e636500604482015260640161037e565b6001600160a01b0383165f90815260046020526040812080548392906106c290849061096e565b90915550506001600160a01b0382165f90815260046020526040812080548392906106ee9084906109b8565b92505081905550816001600160a01b0316836001600160a01b03165f5160206109cc5f395f51905f528360405161072791815260200190565b60405180910390a3505050565b6001600160a01b03821661078a5760405162461bcd60e51b815260206004820152601f60248201527f54524332303a206d696e7420746f20746865207a65726f206164647265737300604482015260640161037e565b8060025f82825461079b91906109b8565b90915550506001600160a01b0382165f90815260046020526040812080548392906107c79084906109b8565b90915550506040518181526001600160a01b038316905f905f5160206109cc5f395f51905f529060200160405180910390a35050565b602081525f82518060208401528060208501604085015e5f604082850101526040601f19601f83011684010191505092915050565b5f81356001600160a81b0381168114610849575f5ffd5b6001600160a01b031692915050565b5f5f60408385031215610869575f5ffd5b61087283610832565b946020939093013593505050565b5f5f5f60608486031215610892575f5ffd5b61089b84610832565b92506108a960208501610832565b929592945050506040919091013590565b5f602082840312156108ca575f5ffd5b5035919050565b5f602082840312156108e1575f5ffd5b6108ea82610832565b9392505050565b5f5f60408385031215610902575f5ffd5b61090b83610832565b915061091960208401610832565b90509250929050565b600181811c9082168061093657607f821691505b60208210810361095457634e487b7160e01b5f52602260045260245ffd5b50919050565b634e487b7160e01b5f52601160045260245ffd5b818103818111156103095761030961095a565b6020808252601e908201527f54524332303a2063616c6c6572206973206e6f7420746865206f776e65720000604082015260600190565b808201808211156103095761030961095a56feddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3efa26474726f6e58221220fa93b59cc497c701a460ea7a640a7ace3828bb85c0a4c92f153400eeb957214464736f6c634300081f0033",
  "generatedAt": "2026-10-20T08:14:16.462Z",
  "note": "Reference metadata only. TronScan does not accept this JSON as the contract file. Upload the flattened .sol source and manually match these compiler/settings fields."
}
