// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Bank {

    mapping(address => uint) balances;

    function sendEtherToContract() payable external {
        balances[msg.sender] += msg.value;
    }

    function getEtherFromContract(address payable to, uint amount) external returns(bool) {
        //to.transfer(balances[msg.sender]);
        //bool isOk = to.send(amount);
        (bool sent,) = to.call{value: amount}("");
        if(sent) {
            balances[msg.sender] -= amount;
        }
       
        return sent;
    }

    function showBalance() external view returns(uint) {
        return balances[msg.sender];
    }

    // Transfer() => duruma göre isteği geri çevirebilir.
    // Send() => işlemin başarısına göre true veya false döndürür.
    // Call() => 

    // default olarak kontratın fonksiyonları
    // bu fonksiyonlar sadece kontrata ether gönderildikleri zaman çalışırlar.
    uint public receiveCount = 0;
    uint public fallbackCount = 0;
    receive() external payable {
        //balances[msg.sender] += msg.value;
        receiveCount++;
    }

    fallback() external payable {
        fallbackCount++;    
    }

    
}