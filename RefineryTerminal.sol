pragma solidity ^0.5.0;

contract RefineryTerminal {
    
    address terminal;
    address refinery;
    uint batch;
    uint start_time = now;
    string product = "RBOB";
    uint volume_product;
    string company = "Valero";
    uint public price;
    uint public payment_terminal;
    uint public fee = 2; 
    
    
    constructor (uint _volume_product) public {
        terminal = msg.sender;
        volume_product = _volume_product;
    }
    
    
    function pipeline_deposit() public view returns (uint){
        return volume_product;
    }
    
    function get_balance() public view returns (uint){
        return address(this).balance;
    }
    
    function pay_to_terminal() payable public {
        
        
        payment_terminal = volume_product * fee;
    
    }
    
    function() external payable {
       pay_to_terminal();  
    }
}   