
from web3 import Web3
import contract_abi
w3 = Web3(Web3.HTTPProvider("http://127.0.0.1:8545"))

transaction = w3.eth.getTransaction('0xea4999bc916a02c7ebc32e3f94af49733ae213ecfe29554e788477394eb4f097')
#print(transaction.input)

contract = w3.eth.contract(address= '0xEcbC8e3429F6A294b2e587CA43E4314D0a5C2286', abi=contract_abi.abi)

#0xEcbC8e3429F6A294b2e587CA43E4314D0a5C2286
contract.decode_function_input(transaction.input)

