#!/bin/bash

# Clean up temporary files
sudo find /tmp -type f -atime +30 -delete 2>/dev/null




# -find /tmp: Searches within the /tmp directory.
# -type f: Restricts the search to files.
# -atime +10: Finds files that were last accessed more than 30 days ago.
# -delete: Deletes the files found by the find command.
# 2>/dev/null: Redirects error messages to /dev/null, effectively silencing them.