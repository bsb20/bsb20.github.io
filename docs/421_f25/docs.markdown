---
layout: 421 
title: Documentation
permalink: /421_f25/docs
---

### [Canvas](https://uncch.instructure.com/courses/91095) | [Gradescope](https://www.gradescope.com/courses/1078768)

## Textbooks and Resources
<img src="https://www.db-book.com/images/db7-cover.jpg" style="max-width: 25%; margin: 0 33% 0" class="mx-auto d-block border rounded p-2" />

The official course textbook is [Database Systems Concepts (7th edition), Silberschatz, et al.](https://www.db-book.com/)
\
\
\
<img src="https://assets.lulu.com/cover_thumbs/1/5/15gjeeky-front-shortedge-384.jpg" style="max-width: 25%; margin: 0 33% 0" class="mx-auto d-block border rounded p-2" />

For additional background on OS concepts, we recommend [Operating Systems: Three Easy Pieces, Arpaci-Dusseau & Arpaci-Dusseau](https://pages.cs.wisc.edu/~remzi/OSTEP/), which is available for free online.


## C++ Links
- [COMP 421 Bootcamp](https://github.com/bsb20/421-bootcamp), which contains several small examples to
  get you familiar with C++11 features.
- [Learncpp](https://www.learncpp.com/) is a useful resource that includes quizzes to test your knowledge. 
- [cppreference](https://en.cppreference.com/w/) has more detailed documentation of language internals.
- [A Tour of C++](https://catalog.lib.unc.edu/catalog/UNCb9358718) and [Effective Modern C++](https://www.goodreads.com/book/show/22800553-effective-modern-c) are also classic books that are widely available.

## Tools
If you are using VSCode, we recommend you to install [CMake Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools), [C/C++ Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack) and [clangd](https://marketplace.visualstudio.com/items?itemName=llvm-vs-code-extensions.vscode-clangd). After that, follow this tutorial to learn how to use the visual debugger in VSCode: [Debug a C++ project in VS Code](https://www.youtube.com/watch?v=G9gnSGKYIg4).

If you are using CLion, we recommend you to follow this tutorial: [CLion Debugger Fundamentals](https://www.youtube.com/watch?v=5wGsRdumueU).


If you prefer to use `gdb` for debugging, there are many tutorials available to teach you how to use `gdb`. Here are some that we have found useful:

- <a href="https://www.cs.cmu.edu/~gilpin/tutorial/">Debugging Under Unix: gdb Tutorial</a>
- <a href="http://www.techbeamers.com/how-to-use-gdb-top-debugging-tips/">GDB Tutorial: Advanced Debugging Tips For C/C++ Programmers</a>
- <a href="https://www.youtube.com/watch?v=PorfLSr3DDI">Give me 15 minutes &amp; I'll change your view of GDB</a> [VIDEO]

## Dev Environment

We recommend developing BusTub on Ubuntu 22.04, or using a provided container image of Ubuntu 22.04. We do not officially support any other environments (i.e., do not open issues or come to office hours to debug them). We do not support WSL. You may be able to build the project on other Ubuntu versions, as well as MacOS, but do so at your own risk.  The grading environment runs
Ubuntu 22.04.

### Linux (Recommended) / macOS (Experimental)

To ensure that you have the proper packages on your machine, run the following script to automatically install them:

```console
# Linux
$ sudo build_support/packages.sh
# macOS
$ build_support/packages.sh
```

Then run the following commands to build the system:

```console
$ mkdir build
$ cd build
$ cmake ..
$ make
```

If you want to compile the system in debug mode, pass in the following flag to cmake:
Debug mode:

```console
$ cmake -DCMAKE_BUILD_TYPE=Debug ..
$ make -j`nproc`
```
This enables [AddressSanitizer](https://github.com/google/sanitizers) by default.

If you want to use other sanitizers,

```console
$ cmake -DCMAKE_BUILD_TYPE=Debug -DBUSTUB_SANITIZER=thread ..
$ make -j`nproc`
```

There are some differences between macOS and Linux (i.e., mutex behavior) that might cause test cases
to produce different results in different platforms. We recommend students to use a Linux VM for running
test cases and reproducing errors whenever possible.

While there are many ways to run in a Linux environment these days, we provide two ways for students to do this using Docker.
The first step for both options is to follow the instructions for [setting up Docker](https://docs.docker.com/get-started/get-docker/) on your host machine.

### Option 1: Docker
If you prefer to develop directly in a Linux environment, you can start and attach to a pre-configure container with all necessary packages installed by running:
```./docker_exec.sh```
This script will create and set up a container image for bustub, or attach to a running bustub container if one already exists.

Some MacOS users have reported a `command not found: docker` error when first running this script.  If you see this error, you most likely need to [add docker to your PATH](https://stackoverflow.com/questions/64009138/docker-command-not-found-when-running-on-mac).

### Option 2: VS Code Dev Containers
If you prefer to use VS Code, this repository is set up to integrate with the VS Code Dev Containers extension.
You can use this by:
1.  Installing the [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers) extension

2.  In VS Code, from the command palette (<kbd>F1</kbd>), select ***Dev Containers: Clone Repository in Named Container Volume***

3.  Enter a name for the named docker volume (can be any name, something like bustub-volume)

4.  Confirm the name of your working directory (should be auto-populated by VS Code)

**WARNING: If you are not prompted for a volume name as in step (3) above, you selected the wrong Dev Containers option in step 2.  Please select the named volume option to prevent data loss.**

You should now be able to develop, test, and commit code directly from the container or VS Code.

<!-- Tutorial links

Github

Environment Setup

Tools
-->
