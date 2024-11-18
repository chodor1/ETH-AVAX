// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleBank {
    // Mapping to store balances of users
    mapping(address => uint) private balances;

    // Function to deposit Ether into the bank
    function deposit() public payable {
        // Use require to ensure the deposit amount is valid
        require(msg.value > 0, "Deposit amount must be greater than zero");

        // Update the user's balance
        balances[msg.sender] += msg.value;
    }

    // Function to check the user's balance
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // Function to withdraw Ether from the bank
    function withdraw(uint amount) public {
        // Use require to ensure the user has sufficient balance
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Deduct the amount from the user's balance
        balances[msg.sender] -= amount;

        // Transfer Ether back to the user
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }

    // Function to reset the bank (for demonstration purposes)
    function resetBank() public {
        // Revert if the user's balance is already zero
        if (balances[msg.sender] == 0) {
            revert("Your balance is already zero");
        }

        // Reset the user's balance to zero
        balances[msg.sender] = 0;

        // Assert to ensure the balance is reset correctly
        assert(balances[msg.sender] == 0);
    }
}
