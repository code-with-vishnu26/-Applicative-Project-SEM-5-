// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PasswordManager {

    struct EncryptedPassword {
        string username;
        bytes32 encryptedPasswordHash;
    }

    mapping(address => EncryptedPassword[]) private passwordStore;

    // Event to be emitted when a new password is stored
    event PasswordStored(address indexed user, string username, bytes32 encryptedPasswordHash);

    // Function to hash and store the encrypted password
    function storeEncryptedPassword(string memory _username, string memory _password) public {
        // Hashing the password with keccak256 (you can hash the username with password for better uniqueness)
        bytes32 encryptedPasswordHash = keccak256(abi.encodePacked(_username, _password));

        passwordStore[msg.sender].push(EncryptedPassword({
            username: _username,
            encryptedPasswordHash: encryptedPasswordHash
        }));

        emit PasswordStored(msg.sender, _username, encryptedPasswordHash);
    }

    // Function to retrieve all stored passwords for the sender (returns the hashed passwords)
    function getStoredPasswords() public view returns (EncryptedPassword[] memory) {
        return passwordStore[msg.sender];
    }

    // Function to retrieve a specific password hash for a username
    function getPasswordForUsername(string memory _username) public view returns (bytes32) {
        EncryptedPassword[] memory userPasswords = passwordStore[msg.sender];
        for (uint i = 0; i < userPasswords.length; i++) {
            if (keccak256(abi.encodePacked(userPasswords[i].username)) == keccak256(abi.encodePacked(_username))) {
                return userPasswords[i].encryptedPasswordHash;
            }
        }
        revert("Username not found");
    }
}
