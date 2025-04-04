// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/**
 * @title Understanding Storage vs Memory
 * @dev Demonstrates the difference between storage and memory in Solidity
 * @notice Uses a simple library book management system as example
 */
contract LibrarySystem {
    // STORAGE - persists on blockchain (like a hard drive)
    struct Book {
        string title;
        string author;
        bool isAvailable;
    }
    
    // Storage variable - written to blockchain
    Book[] public books; // Array in storage
    mapping(uint => address) public bookToBorrower; // Mapping in storage

    /**
     * @dev Adds a new book to the library (storage example)
     * @param _title Book title
     * @param _author Book author
     */
    function addBook(string memory _title, string memory _author) public {
        // This modifies persistent storage
        books.push(Book({
            title: _title,
            author: _author,
            isAvailable: true
        }));
    }

    /**
     * @dev Borrows a book (storage reference example)
     * @param bookId The ID of the book to borrow
     */
    function borrowBook(uint bookId) public {
        // 'storage' creates a reference to existing data
        Book storage book = books[bookId];
        require(book.isAvailable, "Book already borrowed");
        
        // Modifying through reference changes original storage
        book.isAvailable = false;
        bookToBorrower[bookId] = msg.sender;
    }

    /**
     * @dev Gets book info (memory example)
     * @param bookId The ID of the book to view
     * @return title The title of the book
     * @return author The author of the book
     * @return isAvailable The availability status of the book
     */
    function getBookInfo(uint bookId) public view 
        returns (string memory title, string memory author, bool isAvailable) 
    {
        // 'memory' creates a temporary copy
        Book memory book = books[bookId];
        return (book.title, book.author, book.isAvailable);
    }

    /**
     * @dev Updates book title (compares storage vs memory)
     * @param bookId The ID of the book to update
     * @param newTitle The new title
     */
    function updateBookTitle(uint bookId, string memory newTitle) public {
        // Storage reference - modifies original
        Book storage bookStorage = books[bookId];
        bookStorage.title = newTitle;
        
        // Memory copy - doesn't affect original
        Book memory bookMemory = books[bookId];
        bookMemory.title = "This won't change storage";
    }

    // MEMORY - temporary during execution (like RAM)
    function calculateLateFee(uint daysLate) public pure returns (uint) {
        // All these variables are in memory
        uint baseFee = 1 ether;
        uint dailyPenalty = 0.1 ether;
        return baseFee + (daysLate * dailyPenalty);
    }

    /**
     * @dev Demonstrates string memory usage
     * @param prefix Text to add before title
     * @param bookId The book ID
     * @return Modified title
     */
    function prefixBookTitle(string memory prefix, uint bookId) 
        public 
        view 
        returns (string memory) 
    {
        // Strings must be explicitly declared memory
        string memory originalTitle = books[bookId].title;
        return string(abi.encodePacked(prefix, originalTitle));
    }
}

// purpose: talks about solidity memory, storage and proper way for documenting