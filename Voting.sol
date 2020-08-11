pragma solidity 0.5.0 ;

contract Voting {
    
    address public Commissioner ;
    bool public Voting_end = true ;
    bool public stop_party_registration = false ;
    address public ewinner ;
    
    constructor() public {
        
        Commissioner = msg.sender;
    }
    
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
    
    address[] public candidate ;
    mapping(address => Candidate) public Registered;
    mapping(address => Voter) public Voters_registered;
    
    function Register_Candidate(string memory Party) public {
        require(msg.sender != Commissioner);
        require(stop_party_registration == false);
        require(Voting_end == true);
        Candidate storage x = Registered[msg.sender];
        require(x.Registered == false);
        x.Votes = 0;
        x.party = Party;
        x.Address = msg.sender;
        x.Registered = true;
        candidate.push(msg.sender);
    }
    
    
    function Register_Vote(address addr)public {
        require(msg.sender != Commissioner);
        require(Voting_end == false);
        require(msg.sender!= addr);
        
        Voter storage x = Voters_registered[msg.sender];
        require(x.vote == false);
        Candidate storage y = Registered[addr];
        x.vote = true;
        x.candidate = addr;
        y.Votes +=1 ;
    }
    
    function Start_voting() public {
        require(msg.sender == Commissioner);
        require(Voting_end == true);
        Voting_end = false;
    }
    
    function End_voting() public {
        require(msg.sender == Commissioner);
        require(Voting_end == false);
        Voting_end = true;
        Set_Winner();
    }
    
    function Set_Winner() private {
        uint maxVotes ;
        address winner ;
        uint len = candidate.length;
        for(uint i =0; i<len ;i++){
            if(Registered[candidate[i]].Votes > maxVotes)
            {
                maxVotes = Registered[candidate[i]].Votes;
                winner = candidate[i];
            }
        }
        ewinner = winner ;
    }
    
    function Start_Party_Registration() public {
        require(msg.sender == Commissioner);
        require(stop_party_registration == true);
        stop_party_registration = false;
    }
    
    function Stop_Party_Registration() public {
        require(msg.sender == Commissioner);
        require(stop_party_registration == false);
        stop_party_registration = true;
    }
    
}