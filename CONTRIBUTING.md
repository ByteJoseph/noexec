# Contributing to noexec

First off, thank you for considering contributing to `noexec`! It's people like you that make the open-source community such a great place to learn, inspire, and create.

By contributing, you help Termux users overcome Android's security restrictions and keep the project efficient and secure.

## Table of Contents
- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Enhancements](#suggesting-enhancements)
  - [Pull Requests](#pull-requests)
- [Style Guide](#style-guide)
- [Testing](#testing)

## Code of Conduct
This project and everyone participating in it is governed by the [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs
If you find a bug, please create a new **Issue**. Before opening an issue, please:
* Check if the bug is already reported.
* Ensure the bug is reproducible with the latest version.
* Include details about your environment:
    * Android version
    * Termux version
    * The specific binary/command you were trying to run.

### Suggesting Enhancements
We are always looking for ways to make `noexec` faster and more compatible.
* Open an **Issue** with the tag `enhancement`.
* Explain the step-by-step process of how the feature would work.
* Explain why this enhancement would be useful to other users.

### Pull Requests
1. **Fork** the repository.
2. **Clone** your fork to your local machine.
3. **Create a Branch** for your changes (e.g., `git checkout -b feat/add-logging`).
4. **Commit** your changes with clear, descriptive messages.
5. **Push** to your fork and **Submit a Pull Request**.

## Testing
Before submitting a PR, please test your changes in a real Termux environment:
1. Verify the binary executes correctly from `/sdcard` or `/storage/emulated/0`.
2. Verify the temporary file is removed from the PATH after execution.
3. Verify that arguments are passed correctly to the target binary.

## Questions?
If you have questions, feel free to open an issue or contact the maintainer at [ByteJoseph](https://github.com/ByteJoseph).
