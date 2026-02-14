#!/bin/bash
# A simple, persistent web server using netcat.
# This script listens on port 1234 and serves a static message.

while true; do
  printf "HTTP/1.1 200 OK\r\nContent-Length: 8\r\nConnection: close\r\n\r\nWelcome!" | nc -l -p 1234
done
