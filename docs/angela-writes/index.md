---
layout: page
title: Angela Writes!
permalink: /angela-writes/
---

Angela Writes! is the software on a personal writing device: an e-ink screen
with a keyboard, made for distraction-free writing. Its source code is at
[github.com/bsb20/ize-compose](https://github.com/bsb20/ize-compose).

## Google Drive sync

The device can keep a copy of its documents in its owner's Google Drive. When
the owner signs in on the device, it creates a folder named "Angela Writes" in
their Drive and keeps one Google Doc there for each document written on the
device. Edits made to those Docs come back to the device at the next sync.

The device asks only to see, edit, create and delete the specific files it
creates itself. It can't see anything else in the owner's Drive.

Documents travel directly between the device and Google. There is no
Angela Writes server, and the developer never receives anyone's documents or
account information.
