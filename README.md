# Manual Interaction with Network Protocols

This repository documents methods for interacting with common network services like HTTP and FTP on a raw protocol level using netcat (nc). The examples demonstrate how to manually craft protocol commands to test, troubleshoot, or script custom interactions when standard client tools are unavailable.

All work was performed in a sandboxed virtual environment.

---

## HTTP Server Simulation

### Objective
This exercise demonstrates the creation of a simple, persistent web server from the command line that serves a static message.

### Method
A `while` loop in bash ensures the `netcat` listener restarts after every connection. The `printf` command constructs a valid HTTP/1.1 response, including the `Content-Length` header and the double newline (`\r\n\r\n`) that separates headers from the response body.

### Command
The command to run this persistent server is stored in the `http-server.sh` file.
*(See `http-server.sh` )*

---

## Binary File Transfer

### Objective
This exercise documents the process of transferring an executable file from a server to a client using only `netcat` and verifying its integrity.

### Method
The process uses `netcat` to create a raw TCP socket for file transfer.
1.  **Server-side:** `netcat` is set to listen on a port with its standard input redirected from the source file (`/usr/bin/wget`).
2.  **Client-side:** `netcat` connects to the server, and its standard output is redirected into a destination file.
3.  **Verification:** The received file's permissions are changed to executable with `chmod +x`, and the file is run with the `--version` flag to confirm a successful, non-corrupted transfer.

### Commands
The commands for both the server and client are documented in the `file-transfer-commands.txt` file.
*(See `file-transfer-commands.txt`)*

---

## Manual FTP Session

### Objective
This exercise documents a full FTP session (login, directory creation, listing, and deletion) performed using only `netcat`.

### Method
A `netcat` connection was established to the Metasploitable FTP service on port 21. Raw FTP commands were manually typed into the terminal to interact with the server, demonstrating the protocol's command-and-response structure. The server's numeric response codes were observed at each step.

The sequence of commands included:
*   `USER`
*   `PASS`
*   `MKD` (Make Directory)
*   `LIST`
*   `RMD` (Remove Directory)

### Transcript
A partial transcript of the raw FTP session is documented in the `manual-ftp-session.txt` file.
*(See `manual-ftp-session.txt`)*
