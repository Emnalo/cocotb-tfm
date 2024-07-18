#!/bin/bash

# Composed command you want to execute
COMMAND="make SIM=icarus"

# Interval to wait between each execution (in seconds)
INTERVAL=5

# Get the current directory where the script is located
CURRENT_DIRECTORY="$(pwd)"

# Array to store processed directories
declare -a PROCESSED_DIRS

# Function to check if a directory has already been processed
is_directory_processed() {
    local dir_to_check="$1"
    for processed_dir in "${PROCESSED_DIRS[@]}"; do
        if [ "$processed_dir" = "$dir_to_check" ]; then
            return 0 # True
        fi
    done
    return 1 # False
}

# Infinite loop
while true; do
    # Flag to check if there are any directories left to process
    directories_left=false
    
    # Iterate over each directory in the current directory
    for DIRECTORY in "$CURRENT_DIRECTORY"/*/; do
        # Check if it is a directory and hasn't been processed
        if [ -d "$DIRECTORY" ] && ! is_directory_processed "$DIRECTORY"; then
            # Change to the specified directory
            cd "$DIRECTORY" || { echo "Could not access directory $DIRECTORY"; continue; }

            # Execute the composed command
            eval "$COMMAND"

            # Add the directory to the processed list
            PROCESSED_DIRS+=("$DIRECTORY")

            # Return to the original directory
            cd "$CURRENT_DIRECTORY" || { echo "Could not return to directory $CURRENT_DIRECTORY"; exit 1; }

            # Wait for the specified interval
            sleep $INTERVAL
            
            # Set flag to true indicating there are still directories left to process
            directories_left=true
        fi
    done
    
    # If no directories left to process, exit the loop
    if [ "$directories_left" = false ]; then
        break
    fi
done

# Script finished
echo "Script finished."

