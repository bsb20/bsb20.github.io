---
layout: 421 
title: Setting up Docker Machine
permalink: /teaching/421_f25/docs/devcontainer
---

## Setting up Dev Containers
1.  Installing the [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers) extension
2.  In VS Code, from the command palette (<kbd>F1</kbd>), select ***Dev Containers: Clone Repository in Named Container Volume***
3.  Enter a name for the named docker volume (can be any name, something like bustub-volume)
4.  Confirm the name of your working directory (should be auto-populated by VS Code)

**WARNING: If you are not prompted for a volume name as in step (3) above, you selected the wrong Dev Containers option in step 2.  Please select the named volume option to prevent data loss.**

You should now be able to develop, test, and commit code directly from the container or VS Code.
