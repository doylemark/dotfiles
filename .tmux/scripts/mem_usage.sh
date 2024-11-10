#!/usr/bin/env bash

# Get memory stats from vm_stat
vm_stat | awk '
BEGIN { 
    unit = 4096;  # Memory page size in bytes
}
/Pages free/ { free = $3 * unit }
/Pages active/ { active = $3 * unit }
/Pages inactive/ { inactive = $3 * unit }
/Pages speculative/ { spec = $3 * unit }
/Pages wired down/ { wired = $3 * unit }
/Pages occupied by compressor/ { compressed = $5 * unit }
END {
    # Calculate total and used memory
    total = (free + active + inactive + spec + wired + compressed) / 1073741824  # Convert to GB
    used = (active + wired + compressed) / 1073741824  # Convert to GB
    
    # Calculate percentage
    pct = (used / total) * 100
    
    # Choose color based on usage
    if (pct >= 90) color = "red"
    else if (pct >= 75) color = "yellow"
    else color = "green"
    
    # Print result with color
    printf "#[fg=%s]%.1f%%#[default]", color, pct
}'
