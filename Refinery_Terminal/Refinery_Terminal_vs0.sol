pragma solidity ^0.5.0;


contract RefinaryTerminal {
    
    address payable buyer;// The address of the Buyer
    address payable owner;// The address of the contract
    address payable seller;// The address of the seller
    uint public batch;// Identify the produt of the  supplier refinery
    uint public start_time = now;
    string public product;
    uint public volume_product_bbls;
    uint volume_product_gl;
    string public seller_company;
    string public buyer_company;//Valero Wholesale Marketing
    uint public usgcPlatts_cents;// RBOB price per gallon in dollarcents
    uint public payment_refinery;
    uint public EthertoUS;// Ether price in US$
    
    
    constructor (string memory _seller_company, string memory _buyer_company, address payable _buyer, address payable _seller, string memory _product)  public {
        
        owner = msg.sender;
        seller_company = _seller_company;
        buyer_company = _buyer_company;
        buyer = _buyer;
        seller = _seller;
        product = _product;
    
    }
    
    function set_selling (uint _volume_product_bbls, uint _usgcPlatts_cents, uint _EthertoUS) public {
        
        require (msg.sender==owner, "You are not authorized to set the selling of this contract");
        volume_product_bbls = _volume_product_bbls;
        volume_product_gl = volume_product_bbls * 42;
        usgcPlatts_cents = _usgcPlatts_cents;
        EthertoUS = _EthertoUS;
        
         }
    
        
    
    function get_balance() view public returns (uint){
        
        require (msg.sender==owner); 
        return address(this).balance;
        
     }
    
    function pay_refinery() payable public {
       
        uint remaining;
        EthertoUS *= 100;
        
        
        payment_refinery = volume_product_gl * usgcPlatts_cents /  EthertoUS;//  Payment amount in hundredths of dollarcents
        remaining = (volume_product_gl* usgcPlatts_cents) - (payment_refinery * EthertoUS);
        if (remaining * 2 < EthertoUS) {
            payment_refinery+=1;}
            
        else {payment_refinery +=0;
            }
         
        payment_refinery *= 1000000000;// payment to refinery is in Gwei
         
        seller.transfer(msg.value);
      
     }
    
    function() external payable {
       pay_refinery();  
    }
}   