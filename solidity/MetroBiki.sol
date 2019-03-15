pragma solidity ^0.5.0;

contract BicycleRegister {

    event NewBicycle(uint id, string Model, string Color);

    struct Bicycle {
        string Model;
        string Color;
        address Owner;
        uint32 upvoteCount;
        uint32 downvoteCount;
    }

    Bicycle[] public bicycles;

    mapping(uint => address) public bicycleToOwner;
    mapping(address => uint) public ownerBicycleCount;   //

    function _registerBicycle(string memory _Model, string memory _Color) private {
        uint id = bicycles.push(Bicycle(_Model, _Color, msg.sender, 0, 0)) - 1;
        bicycleToOwner[id] = msg.sender;
        ownerBicycleCount[msg.sender]++;
        emit NewBicycle(id, _Model, _Color);
    }

    function registerBicycle(string memory _Model, string memory _Color) public {
        _registerBicycle(_Model, _Color);
    }


    address[] public users;

}