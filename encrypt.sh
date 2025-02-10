#!/bin/bash
gpg -c "$1" && shred -u "$1"