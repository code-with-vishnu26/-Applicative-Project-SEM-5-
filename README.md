# 🔐 Secure Password Management Using Blockchain

This project, **Applicative Project-1**, builds a decentralized, secure password management system leveraging **blockchain technology**. Traditional centralized password storage is susceptible to breaches—this solution aims to eliminate that risk.

---

## 📌 Project Overview

- **🎯 Objective**: Create a decentralized and secure password management system using blockchain technology.  
- **⚠️ Problem Statement**: Centralized password storage is vulnerable to breaches, making a more secure system essential.  
- **🛠️ Methodology**: Passwords are encrypted and stored on the blockchain, enhanced with multi-factor authentication.  
- **✅ Results**: The system offers secure, transparent, and decentralized password management, significantly reducing breach risks.

---

## 🧭 Table of Contents

1. [Abstract](#abstract)  
2. [Introduction](#introduction)  
3. [Literature Survey](#literature-survey)  
4. [Proposed System](#proposed-system)  
5. [Workflow](#workflow)  
6. [Software Requirements](#software-requirements)  
7. [Hardware Requirements](#hardware-requirements)  
8. [References](#references)

---

## 📄 Introduction

Password management is a critical aspect of cybersecurity. With the growing number of online platforms, secure password storage is essential. Traditional methods rely on centralized systems, which are vulnerable to breaches. Blockchain offers a promising solution by decentralizing and securing password storage.

---

## 📚 Literature Survey

Research shows promising advancements in secure password management using blockchain:

- Blockchain-based identity management systems  
- Privacy-enhanced identity management via blockchain  
- Secure identity systems with self-sovereign identity  
- Multi-factor authentication powered by blockchain

---

## 🏗️ Proposed System

Features of the proposed system:

1. **Decentralized Storage** – Password hashes stored on blockchain  
2. **Smart Contracts** – Automates and secures access control  
3. **Multi-Factor Authentication** – Ensures advanced protection  
4. **Private Key Control** – Users manage their own keys  
5. **End-to-End Encryption** – Data encrypted in transit and at rest  
6. **Distributed Key Management** – Spreads key responsibility  
7. **Immutability** – Enables secure audit and account recovery

---

## 🔁 Workflow

### 📜 Smart Contract Design

**Contract:** `PasswordManager`  
**Language:** Solidity `^0.8.8`  
**Structure:**  
```solidity
struct EncryptedPassword {
    string username;
    bytes32 encryptedPasswordHash;
}
mapping(address => EncryptedPassword[]) private passwordStore;
```

### 🔒 Events

```solidity
event PasswordStored(address indexed user, string username, bytes32 encryptedPasswordHash);
```

### ⚙️ Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PasswordManager {
    struct EncryptedPassword {
        string username;
        bytes32 encryptedPasswordHash;
    }

    mapping(address => EncryptedPassword[]) private passwordStore;

    event PasswordStored(address indexed user, string username, bytes32 encryptedPasswordHash);

    function storeEncryptedPassword(string memory _username, string memory _password) public {
        bytes32 encryptedPasswordHash = keccak256(abi.encodePacked(_username, _password));
        passwordStore[msg.sender].push(EncryptedPassword({
            username: _username,
            encryptedPasswordHash: encryptedPasswordHash
        }));
        emit PasswordStored(msg.sender, _username, encryptedPasswordHash);
    }

    function getStoredPasswords() public view returns (EncryptedPassword[] memory) {
        return passwordStore[msg.sender];
    }

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

---

## 🚀 How to Run the Code

### 🔧 Prerequisites

- [Remix IDE](https://remix.ethereum.org)
- [MetaMask](https://metamask.io)
- Ethereum Sepolia Testnet

### 🛠️ Steps

#### 1. Compile the Smart Contract

- Open Remix IDE  
- Create `Password.sol` and paste the above code  
- Use compiler version `0.8.x` and compile

#### 2. Deploy

- Go to "Deploy & Run Transactions"  
- Select **Injected Provider - MetaMask**  
- Connect your MetaMask wallet (on Sepolia Testnet)  
- Set gas limit (optional): `3000000`  
- Deploy the contract

#### 3. Interact with the Contract

##### Store a Password

- Call `storeEncryptedPassword("username", "password")`  
- Confirm in MetaMask  
- View success and logs in Remix console

##### Retrieve Passwords

- Call `getStoredPasswords()` – returns stored credentials  
- Call `getPasswordForUsername("username")` – returns hash

#### 4. Verify Transactions on Etherscan

- Click transaction hash in Remix to open on [Etherscan Sepolia](https://sepolia.etherscan.io)

---

## 💻 Software Requirements

| Component                  | Description                                         |
|---------------------------|-----------------------------------------------------|
| Remix IDE                 | Web-based Ethereum development environment         |
| MetaMask                  | Wallet for signing and sending Ethereum transactions |
| Sepolia Testnet           | Ethereum test network for deploying contracts       |
| Etherscan                 | To verify transactions and contract data            |
| Solidity Compiler         | Used to compile smart contract code                 |
| Web Browser               | Chrome, Firefox, or Brave                           |

---

## 🖥️ Hardware Requirements

| Component                 | Description                                          |
|--------------------------|------------------------------------------------------|
| Standard Computer         | With internet, browser support, and MetaMask         |
| MetaMask Device           | Browser/mobile that supports extensions              |
| Remix IDE (Web)           | Requires only internet access                        |
| Local Node (Optional)     | For Ganache or private testnets                      |
| Storage                   | Sufficient storage for development files             |

---

## 📚 References

- [DApp University](https://www.dappuniversity.com/)
- [IRJMETS Paper (June 2022)](https://www.irjmets.com/uploadedfiles/paper/issue_6_june_2022/26519/final/fin_irjmets1655735566.pdf)
- [IRJET Vol 7, Issue 3](https://www.irjet.net/archives/V7/i3/IRJET-V7I3250.pdf)