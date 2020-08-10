pragma solidity 0.5.0;

contract Certificate{
    
    struct Data{
        string id;
        string sName;
        string course;
    }
    uint public total ;
    address public manager;
    mapping(string => Data) certData;
    
    constructor() public {
        manager = msg.sender;
    }
    
    function createData(string memory _id , string memory _sName , string memory _course) public {
        require(msg.sender == manager,"You are not the manager");
        Data  memory newData = Data({
            id: _id,
            sName: _sName,
            course: _course
        });
        certData[_id] = newData;
        total++;
    }
    
    function getData(string memory _id) public view returns(string memory, string memory, string memory){
        Data storage data = certData[_id];
        return(data.id,data.sName,data.course);
        
    }
}