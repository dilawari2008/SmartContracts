// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// contract 1.
// contract HelloWorld {
//     string public greeting = "hw";

//     function getGreeting() public view returns (string memory) {
//         return greeting;
//     }

//     function setGreeting(string memory _newGreeting) public returns (string memory) {
//         greeting = _newGreeting;
//         return greeting;
//     }

//     function resetGreeting() public {
//         greeting = "hw";
//     }
// }


// contract 2.
// contract DataTypes {
//     bool public isReady;
//     uint public count;
//     int public balance;
//     address public owner;
//     string public greeting;
//     bytes32 public data;
//     uint[] public nums;
//     uint[5] public fixedNums = [1,2,3,4,5];
//     struct User {
//         uint id;
//         string name;
//     }
//     User public user = User(1,"Alice");
//     mapping(address => uint) public balances;

//     constructor() {
//         owner = msg.sender;
//     }

//     function addNumber(uint _num) public {
//         nums.push(_num);
//     }

//     function updateBalance(address _user, uint _balance) public {
//         balances[_user] = _balance;
//     } 

//     function removeLastNumber() public {
//         nums.pop();
//     }

//     function getNumsCount() public view returns (uint) {
//         return nums.length;
//     }


// }


// contract 3
// contract FunctionsAndModifiers {
//     uint public data;
//     address public owner;

//     constructor(uint _initialData) {
//         data = _initialData;
//         owner = msg.sender;
//     }

//     function setData(uint _data) external {
//         data = _data;
//     }

//     function getData() external view returns (uint) {
//         return data;
//     }

//     function doubleData() external {
//         data *= 2;
//     }

//     function resetData() private {
//         data = 0;
//     }

//     function receiveEther () public payable {

//     }

//     modifier onlyOwner() {
//         require(msg.sender == owner, "Not the owner");
//         _;
//     }

//     function ownersFunction() external onlyOwner {

//     }

// }

// contract 4
// contract Ownership {
//     address owner;

//     constructor() {
//         owner = msg.sender;
//     }

//     event OwnershipTransfer(address indexed oldOwner, address indexed newOwner, address indexed contractAddress);

//     modifier onlyowner() {
//         require(msg.sender == owner, "Not the owner");
//         _;
//     }

//     function transferOwnership(address _newOwner) external onlyowner {
//         address oldOwner = owner;
//         owner = _newOwner;
//         emit OwnershipTransfer(oldOwner, owner, address(this));
//     }
// }


// contract 5
// contract Modifiers {
//     address internal owner;
//     bool public isActive;

//     constructor() {
//         owner = msg.sender;
//     }

//     function flipActive() external {
//         isActive = !isActive;
//     }

//     modifier onlyOwner() {
//         require(msg.sender == owner, "Not the owner");
//         _;
//     }

//     modifier onlyWhenActive() {
//         require(isActive, "Contract is not active");
//         _;
//     }


//     function someFunction() public onlyOwner onlyWhenActive {

//     }


// }


// contract 6
// contract BaseContract {
//     uint public data;

//     function setData(uint _data) public {
//         data = _data;
//     }

//     function display() public virtual pure returns (string memory) {
//         return "hw";
//     }
// }

// contract DerviedContract is BaseContract {
//     function increment(uint _increment) public {
//         data += _increment;
//     }

//     function display() public override pure returns (string memory) {
//         return string(abi.encodePacked(super.display() , "h"));
//     }
// }


// contract 7
// abstract contract AbstractContract {
//     function modifyString(string memory _newString) public virtual;

// }

// interface IInterface {
//     function showString() external view returns (string memory);
// }

// contract DerivedContract is  AbstractContract,IInterface {
//     string abstractData;

//     function modifyString(string memory _newString) public override {
//         abstractData = _newString;
//     }

//     function showString() external override view returns (string memory) {
//         return abstractData;
//     }
// }


// contract 8
// contract ErrorHandling {
//     int public value;

//     function setValue(int _value) external {
//         require(_value >= 0, "Negative not allowed");
//         value = _value;
//     }

//     function setValueAgain(int _value) external {
//         if (_value < 0) revert("Negative not allowed");
//         value = _value;
//     }

//     function setValueYetAgain(int _value) external {
//         assert(_value >= 0);
//         value = _value;
//     }
// }

// contract 9

// contract CalldataExample {
//     // Array to store values
//     uint256[] public values;

//     // Function to add values from an array passed as calldata
//     function addValues(uint256[] calldata _values) external {
//         // Iterate over the calldata array and store the values in the contract's state
//         for (uint256 i = 0; i < _values.length; i++) {
//             values.push(_values[i]);
//         }
//     }

//     // Function to get the value at a specific index
//     function getValue(uint256 index) external view returns (uint256) {
//         require(index < values.length, "Index out of bounds");
//         return values[index];
//     }

//     // Function to calculate the sum of values from calldata
//     function sumCalldata(uint256[] calldata _values) external pure returns (uint256) {
//         uint256 total = 0;
//         for (uint256 i = 0; i < _values.length; i++) {
//             total += _values[i];
//         }
//         return total;
//     }
// }


// contract 10
// import "./Libraries.sol";

// contract LibraryImpl {
//     using MathOPerations for uint;

//     uint public a;

//     function setA(uint _a) public returns (uint) {
//         a = _a;
//         return a;
//     }

//     function squareA() public returns (uint) {
//         a = a.square();
//         return a;
//     }

//     function setAMaxB(uint _b) public returns (uint) {
//         a = a.max(_b);
//         return a;
//     }
// }


// contract 11
// contract FallbackReceiveExample {
//     uint public fund;
//     bytes public data;

//     error InsuffecientBalance(uint _balance, uint _value);

//     // fallback() external payable {
//     //     fund += msg.value;
//     //     data = msg.data;
//     //  }

//     fallback() external {
//         data = msg.data;
//      }

//      receive() external payable {
//         fund += msg.value;
//      } 

//      function getBalance() external view returns (uint) {
//         return address(this).balance;
//      }

//      function triggerAnError() external payable {
//         revert InsuffecientBalance(fund, msg.value);
//      }
// }

// contract 12

// import "./PriceConverterV2.sol";
// error NotOwner();
// error NotEnough();

// contract FundMe {
//     using PriceConverterV2 for address;

//     // before using constant - 844388
//     // after using constant - 824418
//     // approx 20K - as much gas used to send eth
//     uint256 public constant MINIMUM_USD = 2; // 2 dollars
//     address[] public funders;
//     mapping (address => uint256) public addressToAmountFunded;
//     address public immutable i_owner;
//     address ethToUSDContract = 0x694AA1769357215DE4FAC081bf1f309aDC325306;

//     constructor () {
//         i_owner = msg.sender;
//     }

//     function fund() public payable  {
//         if (!ethToUSDContract.checkWhetherUSDThresholdBreached(MINIMUM_USD, msg.value)) revert NotEnough();
//         funders.push(msg.sender);
//         addressToAmountFunded[msg.sender] += msg.value;
//     }

//     function withdraw() public onlyOwner {
        
//         for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex += 1) {
//             address funder = funders[funderIndex];
//             addressToAmountFunded[funder] = 0;
//         }

//         funders = new address[](0);

//         // msg.sender -> address
//         // withdraw funds
//         // transfer
//         // payable(msg.sender).transfer(address(this).balance);
//         // send
//         // bool isSendSuccess = payable(msg.sender).send(address(this).balance);
//         // require(isSendSuccess, "Send Failed");
//         // call
//         (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
//         require(callSuccess, "Call failed");
//     }

//     modifier onlyOwner {
//         if (msg.sender != i_owner) revert NotOwner();
//         _;
//     }

//     fallback() external payable {
//         fund();
//     }

//     receive() external payable {
//         fund();
//     }
// }


// contract 13
// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// contract BasicNft is ERC721 {
//     string public constant TOKEN_URI =
//         "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
//     uint256 private s_tokenCounter;

//     constructor() ERC721("Dogie", "DOG") {
//         s_tokenCounter = 0;
//     }

//     function mintNft() public {
//         _safeMint(msg.sender, s_tokenCounter);
//         s_tokenCounter = s_tokenCounter + 1;
//     }

//     function tokenURI(uint256 /*tokenId*/) public pure override returns (string memory) {
//         // require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
//         return TOKEN_URI;
//     }

//     function getTokenCounter() public view returns (uint256) {
//         return s_tokenCounter;
//     }
// }

// contract 14

// for simplicity not using VRF instead just using modded number in rotation

// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

// error RandomIpfsNft__AlreadyInitialized();
// error RandomIpfsNft__NeedMoreETHSent();
// error RandomIpfsNft__RangeOutOfBounds();
// error RandomIpfsNft__TransferFailed();

// contract RandomIpfsNft is ERC721URIStorage, Ownable {
//     // Types
//     enum Breed {
//         PUG,
//         SHIBA_INU,
//         ST_BERNARD
//     }

//     // NFT Variables
//     uint256 private immutable i_mintFee;
//     uint256 private s_tokenCounter;
//     uint256 internal constant MAX_CHANCE_VALUE = 100;
//     string[] internal s_dogTokenUris;
//     bool private s_initialized;

//     // Events
//     event NftRequested(uint256 indexed requestId, address indexed requester);
//     event NftMinted(uint256 indexed tokenId, Breed indexed breed, address indexed minter);

//     constructor(
//         uint256 mintFee,
//         string[3] memory dogTokenUris
//     ) ERC721("Random IPFS NFT", "RIN")  Ownable(msg.sender) {
//         i_mintFee = mintFee;
//         _initializeContract(dogTokenUris);
//         s_tokenCounter = 0;
//     }

//     function requestNft() public payable returns (uint256 requestId) {
//         if (msg.value < i_mintFee) {
//             revert RandomIpfsNft__NeedMoreETHSent();
//         }
//         fulfillNft(msg.sender);
//         emit NftRequested(requestId, msg.sender);
//     }

//     function fulfillNft(address dogOwner) internal {
//         uint256 newItemId = s_tokenCounter; // tokenId
//         s_tokenCounter = s_tokenCounter + 1;
//         uint256 moddedRng = s_tokenCounter % 3;
//         Breed dogBreed = Breed(moddedRng);
//         _safeMint(dogOwner, newItemId);
//         _setTokenURI(newItemId, s_dogTokenUris[uint256(dogBreed)]);
//         emit NftMinted(newItemId, dogBreed, dogOwner);
//     }

//     function _initializeContract(string[3] memory dogTokenUris) private {
//         if (s_initialized) {
//             revert RandomIpfsNft__AlreadyInitialized();
//         }
//         s_dogTokenUris = dogTokenUris;
//         s_initialized = true;
//     }

//     function withdraw() public onlyOwner {
//         uint256 amount = address(this).balance;
//         (bool success, ) = payable(msg.sender).call{value: amount}("");
//         if (!success) {
//             revert RandomIpfsNft__TransferFailed();
//         }
//     }

//     function getMintFee() public view returns (uint256) {
//         return i_mintFee;
//     }

//     function getDogTokenUris(uint256 index) public view returns (string memory) {
//         return s_dogTokenUris[index];
//     }

//     function getInitialized() public view returns (bool) {
//         return s_initialized;
//     }

//     function getTokenCounter() public view returns (uint256) {
//         return s_tokenCounter;
//     }
// }


// contract 15
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

error PriceNotMet(address nftAddress, uint256 tokenId, uint256 price);
error ItemNotForSale(address nftAddress, uint256 tokenId);
error NotListed(address nftAddress, uint256 tokenId);
error AlreadyListed(address nftAddress, uint256 tokenId);
error NoProceeds();
error NotOwner();
error NotApprovedForMarketplace();
error PriceMustBeAboveZero();

// Error thrown for isNotOwner modifier
// error IsNotOwner()

contract NftMarketplace is ReentrancyGuard {
    struct Listing {
        uint256 price;
        address seller;
    }

    event ItemListed(
        address indexed seller,
        address indexed nftAddress,
        uint256 indexed tokenId,
        uint256 price
    );

    event ItemCanceled(
        address indexed seller,
        address indexed nftAddress,
        uint256 indexed tokenId
    );

    event ItemBought(
        address indexed buyer,
        address indexed nftAddress,
        uint256 indexed tokenId,
        uint256 price
    );

    mapping(address => mapping(uint256 => Listing)) private s_listings;
    mapping(address => uint256) private s_proceeds;

    modifier notListed(
        address nftAddress,
        uint256 tokenId
    ) {
        Listing memory listing = s_listings[nftAddress][tokenId];
        if (listing.price > 0) {
            revert AlreadyListed(nftAddress, tokenId);
        }
        _;
    }

    modifier isListed(address nftAddress, uint256 tokenId) {
        Listing memory listing = s_listings[nftAddress][tokenId];
        if (listing.price <= 0) {
            revert NotListed(nftAddress, tokenId);
        }
        _;
    }

    modifier isOwner(
        address nftAddress,
        uint256 tokenId,
        address spender
    ) {
        IERC721 nft = IERC721(nftAddress);
        address owner = nft.ownerOf(tokenId);
        if (spender != owner) {
            revert NotOwner();
        }
        _;
    }

    // IsNotOwner Modifier - Nft Owner can't buy his/her NFT
    // Modifies buyItem function
    // Owner should only list, cancel listing or update listing
    /* modifier isNotOwner(
        address nftAddress,
        uint256 tokenId,
        address spender
    ) {
        IERC721 nft = IERC721(nftAddress);
        address owner = nft.ownerOf(tokenId);
        if (spender == owner) {
            revert IsNotOwner();
        }
        _;
    } */

    /////////////////////
    // Main Functions //
    /////////////////////
    /*
     * @notice Method for listing NFT
     * @param nftAddress Address of NFT contract
     * @param tokenId Token ID of NFT
     * @param price sale price for each item
     */
    function listItem(
        address nftAddress,
        uint256 tokenId,
        uint256 price
    )
        external
        notListed(nftAddress, tokenId)
        isOwner(nftAddress, tokenId, msg.sender)
    {
        if (price <= 0) {
            revert PriceMustBeAboveZero();
        }
        IERC721 nft = IERC721(nftAddress);
        if (nft.getApproved(tokenId) != address(this)) {
            revert NotApprovedForMarketplace();
        }
        s_listings[nftAddress][tokenId] = Listing(price, msg.sender);
        emit ItemListed(msg.sender, nftAddress, tokenId, price);
    }

    /*
     * @notice Method for cancelling listing
     * @param nftAddress Address of NFT contract
     * @param tokenId Token ID of NFT
     */
    function cancelListing(address nftAddress, uint256 tokenId)
        external
        isOwner(nftAddress, tokenId, msg.sender)
        isListed(nftAddress, tokenId)
    {
        delete (s_listings[nftAddress][tokenId]);
        emit ItemCanceled(msg.sender, nftAddress, tokenId);
    }

    /*
     * @notice Method for buying listing
     * @notice The owner of an NFT could unapprove the marketplace,
     * which would cause this function to fail
     * Ideally you'd also have a `createOffer` functionality.
     * @param nftAddress Address of NFT contract
     * @param tokenId Token ID of NFT
     */
    function buyItem(address nftAddress, uint256 tokenId)
        external
        payable
        isListed(nftAddress, tokenId)
        // isNotOwner(nftAddress, tokenId, msg.sender)
        nonReentrant
    {
        // Challenge - How would you refactor this contract to take:
        // 1. Abitrary tokens as payment? (HINT - Chainlink Price Feeds!)
        // 2. Be able to set prices in other currencies?
        // 3. Tweet me @PatrickAlphaC if you come up with a solution!
        Listing memory listedItem = s_listings[nftAddress][tokenId];
        if (msg.value < listedItem.price) {
            revert PriceNotMet(nftAddress, tokenId, listedItem.price);
        }
        s_proceeds[listedItem.seller] += msg.value;
        // Could just send the money...
        // https://fravoll.github.io/solidity-patterns/pull_over_push.html
        delete (s_listings[nftAddress][tokenId]);
        IERC721(nftAddress).safeTransferFrom(listedItem.seller, msg.sender, tokenId);
        emit ItemBought(msg.sender, nftAddress, tokenId, listedItem.price);
    }

    /*
     * @notice Method for updating listing
     * @param nftAddress Address of NFT contract
     * @param tokenId Token ID of NFT
     * @param newPrice Price in Wei of the item
     */
    function updateListing(
        address nftAddress,
        uint256 tokenId,
        uint256 newPrice
    )
        external
        isListed(nftAddress, tokenId)
        nonReentrant
        isOwner(nftAddress, tokenId, msg.sender)
    {
        //We should check the value of `newPrice` and revert if it's below zero (like we also check in `listItem()`)
        if (newPrice <= 0) {
            revert PriceMustBeAboveZero();
        }
        s_listings[nftAddress][tokenId].price = newPrice;
        emit ItemListed(msg.sender, nftAddress, tokenId, newPrice);
    }

    /*
     * @notice Method for withdrawing proceeds from sales
     */
    function withdrawProceeds() external {
        uint256 proceeds = s_proceeds[msg.sender];
        if (proceeds <= 0) {
            revert NoProceeds();
        }
        s_proceeds[msg.sender] = 0;
        (bool success, ) = payable(msg.sender).call{value: proceeds}("");
        require(success, "Transfer failed");
    }

    /////////////////////
    // Getter Functions //
    /////////////////////

    function getListing(address nftAddress, uint256 tokenId)
        external
        view
        returns (Listing memory)
    {
        return s_listings[nftAddress][tokenId];
    }

    function getProceeds(address seller) external view returns (uint256) {
        return s_proceeds[seller];
    }
}


