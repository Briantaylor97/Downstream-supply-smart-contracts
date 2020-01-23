
from web3 import Web3
import contract_abi
w3 = Web3(Web3.HTTPProvider("http://127.0.0.1:8545"))

#Copy transaction ID and paste
transaction = w3.eth.getTransaction('0x7923da4d1102ab1e9a0c3abf6ce2fa4d0978b7de596fe7c349aea77121633331')
#print(transaction.input)

#Contract deployment address
contract = w3.eth.contract(address= '0x9b418545576420424283ce513449402390b2e06e', abi=contract_abi.abi)

#0xEcbC8e3429F6A294b2e587CA43E4314D0a5C2286
print(contract.decode_function_input(transaction.input))

