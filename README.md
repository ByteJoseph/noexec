# noexec

> Run executables from shared storage in Termux.

Have you ever tried to execute a binary from `~/storage/shared` and seen this?

```bash
~/storage/shared $ ./a.out
bash: ./a.out: Permission denied
```

Your binary isn't broken.

Modern Android mounts shared storage with the **`noexec`** flag, which prevents binaries from being executed directly from locations like `~/storage/shared`.

**noexec** is a lightweight CLI that works around this restriction by temporarily copying the executable into Termux's executable directory, running it with all of its arguments, and automatically removing the temporary copy when it finishes.

---

## Installation

```bash
curl -fsSL https://noexec.vercel.app/install.sh | bash
```

After installation, the `noexec` command will be available in your Termux session.

---

## Usage

```bash
noexec <executable> [arguments...]
```

### Examples

Run a compiled C program:

```bash
noexec ./a.out
```

Pass command-line arguments:

```bash
noexec ./a.out hello world
```

Run a binary from another location:

```bash
noexec ~/storage/shared/my_program
```

---

## Why is this needed?

Android does not allow executables to run directly from shared storage.

For example:

```bash
~/storage/shared $ ./a.out
bash: ./a.out: Permission denied
```

Although the file exists and may already have executable permissions, Android blocks execution because the filesystem is mounted with the **`noexec`** option.

Instead of asking you to manually move binaries into Termux's executable directories every time, **noexec** automates the process.

---

## How it works

When you run:

```bash
noexec ./a.out arg1 arg2
```

`noexec` performs the following steps:

1. Copies the executable into Termux's executable directory.
2. Preserves executable permissions.
3. Executes it with every argument you supplied.
4. Waits for the program to exit.
5. Deletes the temporary copy automatically.

Your original executable is never modified.

---

## Features

* 🚀 Run executables directly from shared storage
* 🧹 Automatic cleanup after execution
* ⚡ Lightweight and fast
* 📦 Zero dependencies beyond standard Unix utilities
* 🔒 Original executable remains untouched
* 💬 Supports command-line arguments
* 🛠 Works with binaries produced by C, C++, Rust, Go, Zig, and other compiled languages

---

## Command Reference

Display help:

```bash
noexec
```

Display version:

```bash
noexec --version
```

or

```bash
noexec -v
```

Show project information:

```bash
noexec --credits
```

---

## Requirements

* Termux
* Bash
* Standard Unix utilities (`cp`, `chmod`, `rm`)

---

## Frequently Asked Questions

### Does `noexec` modify my original file?

No.

Your executable remains exactly where it is. A temporary copy is created solely for execution and is deleted immediately afterwards.

### Does it leave files behind?

No.

Temporary files are removed automatically once execution finishes.

### Can I pass arguments to my program?

Yes.

Everything after the executable path is forwarded exactly as provided.

Example:

```bash
noexec ./server --port 8080 --debug
```

---

## Contributing

Bug reports, feature requests, and pull requests are always welcome.

If you discover an issue or have an idea for improvement, feel free to open an issue or submit a pull request.

---

## License

This project is licensed under the MIT License.

---
