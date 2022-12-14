// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

library Math {
    
    function plus(uint x, uint y) public pure returns(uint) {
        return x + y;
    }

    function minus(uint x, uint y) public pure returns(uint) {
        require(y <= x , "Sonuc negatif olamaz !!");
        return x - y;
    }

    function multi(uint x, uint y) public pure returns(uint) {
        return x * y;
    }

    function divide(uint x, uint y) public pure returns(uint) {
        require(y != 0, "0 OLAMAZ !!");
        return x / y;
    }

    function min(uint x, uint y) public pure returns(uint) {
        return x > y ? y : x;
    }
    
    function max(uint x, uint y) public pure returns(uint) {
        return x > y ? x : y;
    }
}

library Search {
    function indexOf(uint[] memory list, uint data) public pure returns(uint) {
        for(uint i = 0; i < list.length; i++) {
            if(list[i] == data) {
                return i;
            }
        }

        return list.length;
    }
}


contract Library {
    // function trial(uint x, uint y) public pure returns(uint) {
    //     return Math.plus(x,y);
    // }

    // function trial2(uint x, uint y) public pure returns(uint) {
    //     return Math.minus(x,y);
    // }

    // function trial3(uint x, uint y) public pure returns(uint) {
    //     return Math.multi(x,y);
    // }

    // function trial4(uint x, uint y) public pure returns(uint) {
    //     return Math.divide(x,y);
    // }

    // function trial5(uint x, uint y) public pure returns(uint) {
    //     return Math.min(x,y);
    // }

    // function trial6(uint x, uint y) public pure returns(uint) {
    //     return Math.max(x,y);
    // }

    // function trial2(uint[] memory x, uint y) public pure returns(uint) {
    //     return Search.indexOf(x,y);
    // }


    // OR

    using Math for uint;
    using Search for uint[];

    function trial(uint x, uint y) public pure returns(uint) {
        return x.plus(y);
    }

    function trial2(uint[] memory x, uint y) public pure returns(uint) {
        return x.indexOf(y);
    }

}

library Human {
    struct Person {
        uint age;
    }

    function birthday(Person storage _person) public {
        _person.age += 1;
    }

    function showAge(Person storage _person) public view returns(uint) {
        return _person.age;
    }
}


contract HumanContract {
    mapping(uint => Human.Person) people;

    function newYear() public {
        Human.birthday(people[0]);
    }

    function show() public view returns(uint) {
        return Human.showAge(people[0]);
    }

}