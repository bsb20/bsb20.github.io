---
layout: 421 
title: Setting up Docker Machine
permalink: /teaching/421_f25/docs/docker-machine
---

## Why Docker?
For course projects, we strongly recommend running your coding environment in Docker. The Dockerfile we provide ensures you'll use the exact same versions of compilers, linkers, and other tools as the TAs. This guarantees consistency across all environments, allowing you to focus on the assignment's core concepts rather than troubleshooting setup issues caused by version mismatches.

## Official Docker Desktop Installation
- [Install on Mac](https://docs.docker.com/desktop/setup/install/mac-install/)
- [Install on Windows](https://docs.docker.com/desktop/setup/install/windows-install/)
- [Install on Linux](https://docs.docker.com/desktop/setup/install/linux/)

## Alternative for lightweight runtime -- Installing Docker on MacOS
[Colima](https://github.com/abiosoft/colima) is a software that provides Docker runtime. For MacOS users, we recommend installing [Homebrew](https://brew.sh/), a package manager, for easy install experience.

Install Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Install Colima and Docker:
```bash
brew install colima docker
colima start
```

Confirm that Docker is correctly installed:
```bash
docker ps
```

You should be expecting an output like this:
```bash
❯ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```