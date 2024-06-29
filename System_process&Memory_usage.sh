#!/bin/bash
ps aux --sort=-%mem | head -n 2 | column -t


# Explanation
# •ps aux: Lists all running processes.
# •--sort=-%mem: Sorts the processes by memory usage in descending order.
# •head -n 10: Displays the top 10 processes by memory usage.