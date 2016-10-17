1. What are some of the key design philosophies of the Linux operating system?
-linux provides more control to its users
-programs should do one thing, and do it well
-programs should work together
-programs should handle text streams

2. What is a VPS (Virtual Private Server)? What are the advantages of using a VPS?
A VPS is essentially a computer without the hardware. It runs separately from a user's local machine.
The advantages of a VPS are that if you run a dangerous command and things blow up, you can always
destroy the VPS and initialize a new one.

3. Why is it considered a bad idea to run programs as the root user on a Linux system?
A root user is similar to a system administrator: it can modify the system in ways that other 
users can't. It's a bad idea to run programs as the root user if the server is hacked, because
the entire system is compromised.