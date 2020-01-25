PROJECT 3

REFINERY TO TERMINAL CONTRACT

Building this smart contract to automate selling of RBOB from refynery to distributors. The RBOB is the gasoline that could be added with other components to get a better performance of this product. These selling are the major purchases in the process of comercialization of this product.
The contract is a model simplifying the real world but keeping the fundamental of the process of the comercialization in this stage. 

SELLER  : REFINERY (e.g. Valero Refinery) 
BUYER   : DISTRIBUTOR (e.g. Valero Wholesale Marketing)
Product : RBOB (Reformulated Gasoline Blendstock for Oxygenate Blending)
Date    : Giving by now

THE SELLING (e.g.)
        
        Volume of the product = 50000 barrels of RBOB
        Price of RBOB per gallon = $1.65 (referencial price taked from usgc platts)
        Ether to US$ = $ 175



The contract will:

        Establish the Seller, the buyer, the date of the contract through now function, and the product to give it flexibility. It will use a constructor to establish the owner of the contract through the msg.sender. Also include a payable addresses of the buyer and the seller.

        Set the selling transaction that only must be doing by the owner. The owner will set the volume of the product, the price of RBOB in cents, and the exchange rate between the Ether to US dollar because the payment will be in ethers.

        Determine the payment to refinery. This payment  will be  determined multiplying the volumen of the product (barrels) and the price of the RBOB ($/gallon) previous conversion of the barrels to gallons. Then the amount of dollar has been converted to ethers rounding to whole as a simple way to compensate the fact that solidity does not use float numbers. The payment to refinery computation will be inside a payable function, called pay_refinery().

        Use an external payable function in order to make easy the payment to the refinery by any buyer. The payment will be made by an external account to the contract. The external payable function activates pay_refinery function that has a transfer function with the purpose that automatically the contract pass the money to the seller. 

        Get a balance to check that no money will be retained or stuck on the contract. So the balance always will be in zero, because money in the contract pass automatically to the seller.

TEST ON THE LOCALNET 8545

        The address of the Refinery Terminal contract is 0x416BD58988f5F616B4B488A719aE9E8C6d7454Aa.

        Set selling transaction mined and succesful, and set by the owner. See picture RefineryTerminalsetselling.png

        Determining the payment to refinery using pay_refinery() that transaction is shown on picture RefineryTerminal_pay_refinery.png. Also the picture  shows that transaction has been mined and succesful, e.g 19801 ethers.

        The payment process itself using the external payable function. The payment was made by the buyer using the buyer account sending money to the contract. The sucsessful payment is shown on RefineryTerminal_fallback_success.png. It shows that the buyer account has been charged with 3 ethers. The last picture shows that the seller address account has been increased in 3 ethers as a result the transfer function that transfer ethers from the contract to the seller. It can be appreciated from metamask, RefineryTerminal_fallback_payment_fromcontract_to_seller.png


TEST ON THE KOVAN TESTNET

        The address of the Refinery Terminal contract is The address of the Refinery Terminal contract is 0x416BD58988f5F616B4B488A719aE9E8C6d7454Aa.
         Contract deployed sucssesful on Etherscan picture RefineryTerminaldeployed_Etherscan_KTN.png


        Set selling transaction by the owner. See picture RefineryTerminalsetselling_KTN.png

        Determining the payment to refinery using pay_refinery() shown on picture RefineryTerminal_pay_refinery_KTN.png, e.g 19801 ethers.  

        The payment process itself using the external payable function has been confirmed clearly on Etherscan. The payment made by the buyer to the contract,then from the contract to the seller. As example it was sent 0.005 ethers. Picture RefineryTerminal_fallback_payment_frombuyer_ to_contract_then_to_seller_KTN.png










        


