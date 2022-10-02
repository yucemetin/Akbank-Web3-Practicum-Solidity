// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


/*

memory : Geçici hafıza
storage : kalıcı hafıza
calldata : readonly memory


bytes, string, array, struct => kontrat üzerinde her zaman storage'dır.
fakat fonksiyon argumanı olurlarsa önlerine memory veya calldata yazılması gerekir.

*/

struct Student {
    uint8 age;
    uint16 score;
    string name;
}

contract DataLocation {
    uint256 totalStudents = 0;              // storage
    mapping(uint256 => Student) students;   // storage

    function addStudent(string calldata _name, uint8 _age, uint16 _score) external {
        uint256 currentId = totalStudents++;
        students[currentId] = Student(_age,_score,_name);
    }

    function changeStudentInfo(uint256 id, string calldata _name, uint8 _age, uint16 _score) external {
        Student storage currentStudent = students[id];
        
        currentStudent.name = _name;
        currentStudent.age = _age;
        currentStudent.score = _score;
    }

    function getName(uint256 id) external view returns(string memory){
        return students[id].name;
    }
}