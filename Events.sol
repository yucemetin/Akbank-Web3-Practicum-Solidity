// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Events {
     enum Status {
        Taken, // 0
        Preparing, // 1
        Boxed, // 2
        Shipped // 3
    }

    struct Order {
        address customer;
        string zipCode;
        uint256[] products;
        Status status;
    }

    Order[] public orders;
    address public owner;
    uint256 public txCount;

    event OrderCreated(uint256 _orderId, address indexed _consumer);
    event ZipChange(uint256 _orderId,string _zipCode , address indexed _consumer);

    constructor() {
        owner = msg.sender;
    }
    
    function createOrder(string memory _zipCode, uint256[] memory _products) incTx checkProducts(_products) external returns(uint256) {

        orders.push(Order(msg.sender,_zipCode,_products,Status.Taken));
        
        emit OrderCreated(orders.length -1,msg.sender);

        return orders.length -1;
    }

    function advanceOrder(uint256 _orderId) checkOrderId(_orderId) onlyOwner external {

        Order storage order = orders[_orderId];
        require(order.status != Status.Shipped, "Siparis zaten yola cikti");

        if (order.status == Status.Taken) {
            order.status = Status.Preparing;
        } else if (order.status == Status.Preparing) {
            order.status = Status.Boxed;
        } else if (order.status == Status.Boxed) {
            order.status = Status.Shipped;
        }
    }

    function getOrder(uint256 _orderId) checkOrderId(_orderId) external view returns(Order memory) {

        return orders[_orderId];
    }

    function updateZipt(uint256 _orderId, string memory _zipCode) incTx checkOrderId(_orderId) public {

        Order storage order = orders[_orderId];

        require(order.customer == msg.sender, "Musteri siz degilsiniz!!");
    
        order.zipCode = _zipCode;

        emit ZipChange(_orderId,_zipCode,msg.sender);
    }

    modifier checkProducts(uint256[] memory _products) {
        require(_products.length > 0, "Urun yok!");
        _;
    }

    modifier checkOrderId(uint256 _orderId) {
        require(_orderId < orders.length, "Gecersiz siparis numarasi");
        _;
    }

    modifier incTx {
        _;
        txCount++;
    }

    modifier onlyOwner {
         require(owner == msg.sender, "Yetkiniz yok!!");
         _;
    }
}