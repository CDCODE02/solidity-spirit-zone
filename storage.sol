// This is where we write our codes

// First add the pragma solidity as it helps to know our contract version

pragma solidity >=0.7.0 <0.9.0;

// This is a smartcontract that receive, store, and return data

contract simpleStorage{
    //all codes will be writen inhere - functions and its state

    uint storeData;

    //now lets write the functions types we need which are set and get

    function set(uint x) public {
        storeData = x;
    }

    function get() public view returns (uint) {
        return storeData;
    }
}
