# noexec

A CLI tool designed to overcome Android 10+ security restrictions, allowing you to run executables from shared storage within Termux.

## Quick Installation

Install noexec with a single command:

```bash
curl  https://noexec.vercel.app/install.sh | bash
```

This will download and install noexec in your Termux environment.

## The Problem: Android 10+ Executable Restrictions

Starting with Android 10, significant security enhancements were introduced that prevent direct execution of binaries from commonly used storage locations like `/sdcard` directory. This means that even if you download or compile an executable, you cannot simply run it by typing its path. This restriction is in place to enhance device security and prevent malicious code execution.

## Usage

The syntax for noexec is simple:

```bash
noexec <executable> <args...>
```

noexec takes an executable file and any arguments you want to pass to it. It temporarily copies the executable to your system PATH, runs it with the provided arguments, and then automatically removes it when execution completes.

## Examples

### Basic Usage

Execute a compiled C program:

```bash
noexec ./a.out arg1 arg2..
```

### Execute from Different Directory

Run executables from any location:

```bash
noexec /path/to/my/binary
```

### Complex Command Line

Pass complex arguments and options:

```bash
noexec ./server --port=8080
```

## Options

### Version Information

Display the current version:

```bash
noexec -v
```

```bash
noexec --version
```

### Help

Display usage information (run without arguments):

```bash
noexec
```

### Credits

Show author and project information:

```bash
noexec --credits
```

## How It Works: The noexec Solution

`noexec` provides an elegant workaround for this restriction. It operates by:

1.  **Temporary Relocation:** When you use `noexec`, it temporarily copies your specified executable to a directory within your system's PATH (e.g., `/data/data/com.termux/files/usr/bin` in Termux). This directory is whitelisted by Android for executable permissions.
2.  **Execution:** Once copied, `noexec` makes the temporary file executable and then runs it with all the arguments you provided.
3.  **Automatic Cleanup:** Crucially, immediately after the executable finishes running (or if it crashes), `noexec` automatically deletes the temporary copy from the PATH directory. This ensures no permanent changes are made to your system and keeps your environment clean.

This approach allows you to run any executable as if it were installed system-wide, without permanently modifying your PATH or system directories. The cleanup happens automatically, even if the program exits unexpectedly, ensuring a secure and clean execution environment.

### Key Features & Benefits

- **Bypasses Android 10+ Restrictions:** Run executables from any storage location.
- **Zero Dependency:** No complex setup required. Install once and use immediately.
- **Secure Execution:** Temporarily copies executables and cleans up automatically.
- **Lightning Fast:** Minimal overhead with automatic cleanup.
- **Preserves Original File Permissions:** Your original executable remains untouched.
- **Works with Any Executable Format:** Supports various binary formats.

## Requirements

- Bash shell
- Write permissions to system PATH directory
- Standard Unix utilities (cp, chmod, rm)

## Contact

Created by Joseph Joseph (ByteJoseph)
Email: bytejoseph23@gmail.com
