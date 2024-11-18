#!/usr/bin/env bash

# Get CPU usage using top command
top -l 2 -n 0 -s 2 | awk '
/CPU usage/ {
    # Extract user, system, and idle percentages
    if (NR > 5) {  # Skip first sample, use second for accuracy
        split($3, user, "%")      # user cpu
        split($5, sys_cpu, "%")   # system cpu
        split($7, idle, "%")      # idle cpu
        
        # Calculate total CPU usage
        usage = user[1] + sys_cpu[1]
        
        # Choose color based on usage
        if (usage >= 90) color = "red"
        else if (usage >= 75) color = "yellow"
        else color = "green"
        
        # Print result with color
        printf "#[fg=%s]%.1f%%#[default]", color, usage
        exit
    }
}' 
