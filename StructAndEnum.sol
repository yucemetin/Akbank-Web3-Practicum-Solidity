// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StructEnum {

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

    constructor() {
        owner = msg.sender;
    }
    
    function createOrder(string memory _zipCode, uint256[] memory _products) external returns(uint256) {
        
        require(_products.length > 0, "Urun yok!");


        // 1.YOL
        // Order memory order;
        // order.customer = msg.sender;
        // order.zipCode = _zipCode;
        // order.products = _products;
        // order.status = Status.Taken;
        // orders.push(order);

        // 2.YOL
        // orders.push(
        //     Order({
        //         customer: msg.sender,
        //         zipCode: _zipCode,
        //         products: _products,
        //         status: Status.Taken
        //     })
        // );

        // 3.YOL
        orders.push(Order(msg.sender,_zipCode,_products,Status.Taken));
        
        return orders.length -1;
    }

    function advanceOrder(uint256 _orderId) external {
        require(owner == msg.sender, "Yetkiniz yok!!");
        require(_orderId < orders.length, "Gecersiz siparis numarasi");

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

    function getOrder(uint256 _orderId) external view returns(Order memory) {
        require(_orderId < orders.length, "Gecersiz siparis numarasi");

        return orders[_orderId];
    }

    function updateZipt(uint256 _orderId, string memory _zipCode) public {
        require(_orderId < orders.length, "Gecersiz siparis numarasi");
        Order storage order = orders[_orderId];

        require(order.customer == msg.sender, "Musteri siz degilsiniz!!");
        order.zipCode = _zipCode;
    }

}