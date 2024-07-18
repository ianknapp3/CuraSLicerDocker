#!/bin/bash

# Set default input and output directories
INPUT_DIR="/input"
OUTPUT_DIR="/output"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -l|--input)
        INPUT_FILE="$2"
        shift # past argument
        shift # past value
        ;;
        -o|--output)
        OUTPUT_FILE="$2"
        shift # past argument
        shift # past value
        ;;
        *)
        shift # unknown option
        ;;
    esac
done

# Ensure required parameters are set
if [ -z "$INPUT_FILE" ] || [ -z "$OUTPUT_FILE" ]; then
    echo "Usage: $0 --input <input_file.stl> --output <output_file.gcode>"
    exit 1
fi

# Navigate to CuraEngine build directory
cd /CuraEngine/build

# Execute slicing command with CuraEngine
./CuraEngine slice -l "$INPUT_FILE" -o "$OUTPUT_FILE"

# Optionally, you can copy the output file to the specified output directory
# if [ -d "$OUTPUT_DIR" ]; then
#     cp "$OUTPUT_FILE" "$OUTPUT_DIR"
# fi

# Keep the container running
tail -f /dev/null
