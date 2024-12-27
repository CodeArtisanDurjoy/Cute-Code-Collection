# Shell Scripting Cute Code Collection

Welcome to the **Shell Scripting Cute Code Collection**! 🎉 This repository is a curated set of concise, elegant, and practical shell scripting snippets for your everyday needs. Whether you're automating tasks, troubleshooting, or just having fun with the terminal, this collection has something for everyone. 🚀

---

## Table of Contents

1. [Introduction](#introduction)
2. [Getting Started](#getting-started)
3. [Code Snippets](#code-snippets)
   - [File Management](#file-management)
   - [System Monitoring](#system-monitoring)
   - [Network Utilities](#network-utilities)
   - [Text Processing](#text-processing)
   - [Fun & Games](#fun--games)
4. [How to Contribute](#how-to-contribute)
5. [License](#license)

---

## Introduction

This repository is designed for:
- Developers looking for quick solutions to common tasks.
- Learners aiming to sharpen their shell scripting skills.
- Enthusiasts exploring the power of the command line.

Each snippet is designed to be compact, reusable, and easy to understand. 💡

---

## Getting Started

1. Clone the repository:
   ```bash
   git clone [Cute-Code-Collection](https://github.com/CodeArtisanDurjoy/Cute-Code-Collection)
   cd shell-cute-code
   ```
2. Browse through the categorized snippets.
3. Execute or adapt them as per your requirements.

---

## Code Snippets

### File Management

#### 1. Count Files in Directory
```bash
ls | wc -l
```

#### 2. Delete Files Older than 7 Days
```bash
find . -type f -mtime +7 -exec rm -f {} \;
```

---

### System Monitoring

#### 1. CPU Usage
```bash
top -b -n1 | grep "Cpu(s)"
```

#### 2. Memory Usage
```bash
free -h
```

---

### Network Utilities

#### 1. Check Internet Connectivity
```bash
ping -c 4 google.com
```

#### 2. Fetch Public IP
```bash
curl ifconfig.me
```

---

### Text Processing

#### 1. Search for a Pattern in Files
```bash
grep -r "pattern" .
```

#### 2. Replace Text in Files
```bash
sed -i 's/old_text/new_text/g' file.txt
```

---

### Fun & Games

#### 1. Create a Matrix Effect
```bash
while true; do echo $RANDOM | md5sum | head -c 20; echo; done
```

#### 2. Display a Cow Saying Something
```bash
cowsay "Shell scripting is cute!"
```

---

## How to Contribute

We welcome contributions! 🎉 Here's how you can help:

1. Fork the repository.
2. Add your awesome script/snippet to the relevant section.
3. Submit a pull request with a clear description of your addition.

---

## License

This project is licensed under the MIT License. Feel free to use, modify, and share it as you like. 😊

---

**Happy scripting! 💻✨**
