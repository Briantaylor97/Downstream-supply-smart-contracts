pragma solidity ^0.5.11;


//remit payment to refinery for product and fees for delivery to terminal 
contract TerminalPurchaseTruck {
    address payable owner;
    address payable _buyer;
    string public deliveryDate;
    string public productType;
    uint public _volume;
    uint public usgcPlatts;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "You cannot modify this contract");
        _;
    }
    
    constructor(address payable Buyer, string  memory Date, string memory Product, uint Volume, uint Price) public {
        owner = msg.sender;
        _buyer = Buyer;
        deliveryDate = Date;
        productType = Product;
        _volume = Volume;
        usgcPlatts = Price;
    }
    
    //Getter function to 
    function getPurchase()public view returns(address payable, string memory, string memory, uint, uint) {
        return (_buyer, deliveryDate, productType, _volume, usgcPlatts);
    }
    // //Set product lifting from Rack.
    function productLift(address payable my_buyer, string memory delivery_date, string memory product_type, uint my_volume, uint Rack_Price) public {
        _buyer = my_buyer;
        deliveryDate = delivery_date;
        productType = product_type;
        _volume = my_volume;
        usgcPlatts = Rack_Price;
    }
}
