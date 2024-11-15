# GamifiedTaskTracker Smart Contract

## Overview

The GamifiedTaskTracker smart contract is a decentralized application built in Solidity that enables users to register tasks, earn points by completing them within 24 hours, and redeem their points upon reaching a defined threshold. It highlights Solidity's features like task registration, timed task completion, and robust error handling mechanisms (require(), assert(), and revert()).

## Features

- **Mission Registration**: Allows users to register tasks by specifying a name and description.
- **Mission Completion**: Rewards users with points for completing tasks within a 24-hour window.
- **Point Redemption**: Enables users to redeem their points once they surpass the reward threshold.
- **Error Handling**: Implements error handling with:
  - **`require()`**: Validates user input and ensures preconditions are met (e.g., task existence or sufficient points).
  - **`assert()`**: Verifies the correctness of the points balance after redemption.
  - **`revert()`**: Halts and reverses a transaction if a task is completed beyond the allowed time frame.
