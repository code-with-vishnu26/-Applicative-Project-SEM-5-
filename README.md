# Secure Password Management Using Blockchain

This project, "Applicative Project-1," aims to build a decentralized, secure password management system leveraging blockchain technology. Traditional centralized password storage methods are susceptible to breaches, making a more secure solution essential.

## Project Overview

[cite\_start]**Objective:** To create a decentralized and secure password management system using blockchain technology[cite: 34].

[cite\_start]**Problem Statement:** Centralized password storage is vulnerable to breaches, necessitating a more secure solution[cite: 35].

[cite\_start]**Methodology:** Passwords will be encrypted and stored on a blockchain, enhanced with multi-factor authentication for increased security[cite: 36].

[cite\_start]**Results:** The system will offer secure, transparent, and decentralized password management, significantly reducing the risk of breaches[cite: 37].

## Table of Contents

1.  [cite\_start]Abstract [cite: 22]
2.  [cite\_start]Introduction [cite: 23]
3.  [cite\_start]Literature Survey [cite: 24]
4.  [cite\_start]Proposed System [cite: 25]
5.  [cite\_start]Work Flow [cite: 26]
6.  [cite\_start]Software Requirements [cite: 27]
7.  [cite\_start]Hardware Requirements [cite: 28]
8.  [cite\_start]References [cite: 29]

## Introduction

[cite\_start]Password management is a critical aspect of cybersecurity[cite: 40]. [cite\_start]With the growing number of online platforms and the sensitive data they handle, secure password storage and management have become essential[cite: 40]. [cite\_start]Traditional methods often rely on centralized systems, which are vulnerable to breaches, data leaks, and cyberattacks[cite: 41]. [cite\_start]Blockchain technology offers a potential solution by decentralizing and securing password management systems[cite: 42].

## Literature Survey

[cite\_start]A literature survey on secure password management using blockchain technology explores how researchers are using blockchain to improve password security[cite: 45]. They are focusing on:

  * [cite\_start]Blockchain-based identity management systems[cite: 47].
  * [cite\_start]Improving Privacy and Security of Identity Management Systems Using Blockchain Technology[cite: 48].
  * [cite\_start]A Systematic Literature Mapping On Secure Identity Management Using Blockchain Technology[cite: 49].
  * [cite\_start]Blockchain-Based Identity Management System and Self-Sovereign Identity Ecosystem[cite: 50].
  * [cite\_start]Blockchain-based multi-factor authentication[cite: 51].

## Proposed System

The proposed system incorporates several key features to ensure secure and decentralized password management:

1.  [cite\_start]**Decentralized Storage:** Uses blockchain to store encrypted password hashes, reducing reliance on central databases[cite: 54].
2.  [cite\_start]**Smart Contracts:** Automates password management and enforces access control[cite: 55].
3.  [cite\_start]**Enhanced Authentication:** Multi-factor methods and zero-knowledge proofs protect user data[cite: 56].
4.  [cite\_start]**Private Key Control:** Users manage their own private keys for added security[cite: 57].
5.  [cite\_start]**End-to-End Encryption:** Protects data while being stored and transmitted[cite: 58].
6.  [cite\_start]**Distributed Key Management:** Security keys are spread across multiple locations[cite: 59].
7.  [cite\_start]**Immutability:** Blockchain ensures data can't be changed, aiding secure account recovery and audits[cite: 60].

## Workflow

The workflow for this Secure Password Management smart contract involves the following steps:

1.  **Contract Structure:**

      * [cite\_start]The smart contract is named "PasswordManager" using Solidity version `^0.8.8`[cite: 95].
      * [cite\_start]It contains a struct called "EncryptedPassword" that stores: `username` (string) and `encryptedPasswordHash` (bytes32)[cite: 96, 97, 98].
      * [cite\_start]A `mapping(address => EncryptedPassword[]) private passwordStore;` is used to store passwords, associating multiple encrypted passwords with a user's address[cite: 2].
      * [cite\_start]An `event PasswordStored` is emitted when a new password is stored, including the user's address, username, and encrypted password hash[cite: 3].

2.  **Solidity Code (Password.sol):**

    ```solidity
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
    ```

## How to Run the Code

To run this smart contract and interact with it, you will primarily use **Remix IDE** and **MetaMask**.

### 1\. Initial Setup

1.  [cite\_start]**Open Remix IDE:** Go to [https://remix.ethereum.org](https://remix.ethereum.org) in your web browser[cite: 148].
2.  **Create Contract File:**
      * In the Remix IDE's "File Explorers" panel, create a new folder (e.g., `Contracts`).
      * [cite\_start]Inside this folder, create a new file named `Password.sol`[cite: 90].
      * [cite\_start]Copy and paste the `Password.sol` Solidity code provided above into this file[cite: 91].
3.  [cite\_start]**Install MetaMask:** Ensure you have the MetaMask browser extension installed and set up[cite: 66, 77].
4.  **Connect MetaMask to Sepolia Testnet:**
      * [cite\_start]Open your MetaMask wallet[cite: 143].
      * [cite\_start]Select the "Sepolia Test Network" from the network dropdown[cite: 144].
      * [cite\_start]Ensure you have sufficient Sepolia ETH in your account for gas fees (you can obtain test ETH from a Sepolia faucet if needed)[cite: 145].

### 2\. Compile the Smart Contract

1.  **Go to the Solidity Compiler Tab:** In Remix IDE, navigate to the "Solidity Compiler" tab (usually the second icon on the left sidebar, resembling a Solidity logo).
2.  [cite\_start]**Select Compiler Version:** Ensure the compiler version is compatible with `pragma solidity ^0.8.0;` (e.g., `0.8.8` or a later `0.8.x` version)[cite: 95].
3.  **Compile `Password.sol`:** Click the "Compile Password.sol" button. If there are no errors, you'll see a green checkmark.

### 3\. Deploy the Smart Contract

1.  [cite\_start]**Go to the Deploy & Run Transactions Tab:** In Remix IDE, navigate to the "Deploy & Run Transactions" tab (usually the third icon on the left sidebar, resembling an Ethereum logo)[cite: 99].
2.  [cite\_start]**Select Environment:** From the "ENVIRONMENT" dropdown, choose "Injected Provider - MetaMask"[cite: 100]. This will connect Remix to your MetaMask wallet.
3.  **Connect Remix to MetaMask:** MetaMask will prompt you to connect. [cite\_start]Allow the connection[cite: 149].
4.  [cite\_start]**Select Account:** Ensure the desired MetaMask account (e.g., "Account 1") is selected in Remix[cite: 101, 146].
5.  [cite\_start]**Set Gas Limit (Optional but recommended):** A gas limit of `3000000` is suggested[cite: 102].
6.  **Select Contract:** Under the "CONTRACT" dropdown, ensure "PasswordManager - contracts/Password.sol" is selected.
7.  [cite\_start]**Deploy:** Click the "Deploy" button[cite: 103].
8.  [cite\_start]**Confirm in MetaMask:** MetaMask will pop up, showing the estimated transaction fee[cite: 157]. [cite\_start]Review the details (e.g., gas limit: 797474 units, total gas fee: 0.009883 SepoliaETH)[cite: 151, 154]. [cite\_start]Click "Confirm" to proceed with the deployment[cite: 158].
9.  [cite\_start]**Verify Deployment:** After confirmation, you can see the transaction status (e.g., "Success") and details (transaction hash, block number, contract address) in the Remix console or on Etherscan for the Sepolia testnet[cite: 104, 165, 175].

### 4\. Interact with the Deployed Contract

Once deployed, the contract will appear under "Deployed Contracts" in the "Deploy & Run Transactions" tab in Remix.

#### a. Storing a Password

1.  **Expand `storeEncryptedPassword`:** Click on the dropdown arrow next to `storeEncryptedPassword`.
2.  **Enter Username and Password:**
      * [cite\_start]In the `_username` field, enter a username (e.g., `"Hemanth"`)[cite: 111, 161].
      * [cite\_start]In the `_password` field, enter a password (e.g., `"1234"`)[cite: 112, 162].
3.  [cite\_start]**Transact:** Click the "transact" button[cite: 113, 163].
4.  **Confirm in MetaMask:** Confirm the transaction in MetaMask when prompted.
5.  **Verify Storage:** The transaction will be recorded, and you can see details in the Remix console. [cite\_start]The password is now encrypted and stored on the blockchain[cite: 167].

#### b. Retrieving Passwords

There are two functions for retrieval:

1.  **`getStoredPasswords()`:**

      * Click the "call" button next to `getStoredPasswords`.
      * [cite\_start]This will return an array of `EncryptedPassword` structs for the currently connected address, containing the stored usernames and their hashed passwords[cite: 117].

2.  **`getPasswordForUsername(string memory _username)`:**

      * Expand the `getPasswordForUsername` function.
      * [cite\_start]In the `_username` field, enter the username for which you want to retrieve the password hash (e.g., `"Hemanth"`)[cite: 118, 169].
      * [cite\_start]Click the "call" button[cite: 170].
      * [cite\_start]The output will be the `bytes32` hash of the encrypted password for that username[cite: 174]. [cite\_start]If the username is not found, it will revert with "Username not found"[cite: 9].

### 5\. Transaction Verification on Etherscan

You can view the details of any transaction (deployment or function calls) on the Sepolia Etherscan block explorer.

1.  [cite\_start]**From Remix Console:** After a transaction, click on the transaction hash in the Remix console to open it directly on Etherscan[cite: 166].
2.  **Etherscan Details:** On Etherscan, you can verify:
      * [cite\_start]Transaction status (e.g., "Success")[cite: 176].
      * [cite\_start]Block number and confirmations[cite: 177].
      * [cite\_start]Timestamp of the transaction[cite: 178].
      * [cite\_start]Transaction fee and gas price[cite: 179, 180].
      * [cite\_start]Input and output data of the contract interaction[cite: 173, 174].
      * [cite\_start]Contract creator and address details[cite: 197, 216].

[cite\_start]This entire process demonstrates the secure storage and retrieval of encrypted passwords on the blockchain, including contract deployment, function execution, transaction verification, and MetaMask integration on the Sepolia testnet[cite: 188, 189, 190, 191, 192, 193, 194].

## Software Requirements

1.  [cite\_start]**Development Environment:** Remix IDE [cite: 65]
2.  [cite\_start]**Blockchain Interaction Tools:** MetaMask [cite: 66]
3.  [cite\_start]**Ethereum Test Network:** Sepolia testnet [cite: 67]
4.  [cite\_start]**Blockchain Explorers:** Etherscan (for Sepolia) [cite: 68]
5.  [cite\_start]**Smart Contract Dependencies:** Solidity Compiler [cite: 69]
6.  [cite\_start]**Operating System and Browser:** Standard OS and modern web browser [cite: 70]
7.  [cite\_start]**Additional Tools:** (e.g., code editors if developing locally) [cite: 71]
8.  [cite\_start]**Security and Encryption:** Cryptographic Libraries (e.g., built-in Solidity functions like `keccak256`) [cite: 72]

## Hardware Requirements

1.  [cite\_start]**General Hardware Requirements:** Standard computer with sufficient RAM and processing power for development and browser-based tools[cite: 75].
2.  [cite\_start]**Specific Hardware for Blockchain Interaction:** A device capable of running MetaMask (e.g., desktop browser, mobile)[cite: 76].
3.  [cite\_start]**Remix IDE (Web-Based):** Internet connectivity is required[cite: 78].
4.  [cite\_start]**Ethereum Node Setup:** Not strictly required if using public testnets and MetaMask, but for local development, a local Ethereum node (e.g., Ganache) would need appropriate hardware resources[cite: 79].
5.  [cite\_start]**Backup and Storage:** Adequate storage for project files and backups[cite: 80].

## References

  * [cite\_start][DApp University](https://www.dappuniversity.com/) [cite: 83]
  * [cite\_start][IRJMETS Paper (June 2022)](https://www.irjmets.com/uploadedfiles/paper/issue_6_june_2022/26519/final/fin_irjmets1655735566.pdf) [cite: 84]
  * [cite\_start][IRJET Paper (Vol 7, Issue 3)](https://www.irjet.net/archives/V7/i3/IRJET-V7I3250.pdf) [cite: 85]
