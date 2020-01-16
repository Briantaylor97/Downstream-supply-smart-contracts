    pragma solidity ^0.5.11;

//remit payment to refinery for product and fees for delivery to terminal 
contract TerminalPurchaseTruck {
    address payable owner;
    address payable buyer;
    string deliveryDate;
    string productType;
    uint volume;
    uint usgcPlatts;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "You cannot modify this contract");
        _;
    }

    //Set product lifting from Rack.
    function productLift(string memory Date, address payable Buyer, string memory Product, uint Volume, uint Rack_Price) view public {
        Date = deliveryDate;
        Buyer = buyer;
        Product = productType;
        Volume = volume;
        Rack_Price = usgcPlatts;
    }
}