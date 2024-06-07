#!/bin/bash

# Function to start tmux in the chosen directory
start_tmux_in_directory() {
    local dir="$1"
    if [ -n "$dir" ]; then
        tmux new-session -c "$dir" -s "$(basename "$dir")"
    else
        echo "No directory selected, exiting..."
        exit 1
    fi
}

# Main function to find directories and pass to fzf
choose_directory() {
    local target_directory="$1"
    local depth="${2:-3}"  # Default depth is 3 if not specified

    # Use find to list directories up to a certain depth
    local dir=$(find "$target_directory" -mindepth 1 -maxdepth "$depth" -type d -print | fzf --prompt="Select a directory: ")

    # Start tmux session in the selected directory
    start_tmux_in_directory "$dir"
}

# Script starts here
# Default search from the current directory or a specified path
start_directory="${1:-.}"

choose_directory "$start_directory"

