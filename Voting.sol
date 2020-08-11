pragma solidity 0.5.0 ;

contract Voting {
    
    address public Commissioner ;
    bool public Voting_end = true ;
    bool public stop_party_registration = false ;
    address public ewinner ;
    
    
    struct Candidate{
        uint Votes;
        string party ;
        address Address;
        bool Registered ;
    }
    
    struct Voter{
        bool vote ;
        address candidate ;
    }
    
    constructor() public {
        
        Commissioner = msg.sender;
    }
    
}