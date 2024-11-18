# SimpleBank Smart Contract

The **SimpleBank** smart contract is a basic Ethereum-based banking system that allows users to deposit, withdraw, and check their Ether balances. It also demonstrates error handling using `require()`, `revert()`, and `assert()`.

---

## Features
1. **Deposit Ether**: Users can send Ether to their account in the contract.
2. **Check Balance**: View your Ether balance in the contract.
3. **Withdraw Ether**: Withdraw a specified amount of Ether, if sufficient balance is available.
4. **Reset Balance**: Reset your balance to zero (for demonstration).

---

## Functions

- **`deposit()`**: Send Ether to the contract to update your balance.
- **`getBalance()`**: Check your Ether balance.
- **`withdraw(uint amount)`**: Withdraw a specified `amount` of Ether.
- **`resetBank()`**: Reset your Ether balance to zero.

---

## License
This project is licensed under the MIT License.
