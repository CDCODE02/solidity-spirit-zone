pragma solidity ^0.8.4;

contract coin {
    address public minter;
    mapping(address => uint) public balances;

    event sent(address from, address to, uint amount);

    string private _symbol;
    string private _name;

    constructor() {
        minter = msg.sender;
        _name = "TOK NME";
        _symbol = "TOL";
    }

    function mint( address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    error InsufficientBalance(uint requested, uint available);

    function send(address receiver, uint amount) public {
        if(amount > balances[msg.sender])
        revert InsufficientBalance({
            requested: amount,
            available: balances[msg.sender]
        });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit sent(msg.sender, receiver, amount);
    }
}
