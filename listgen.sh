#!/bin/bash
# author: Sal
# date: 20250720-1530
# desc: script to generate a gamelist in XML format

echo ""
echo "██╗     ██╗███████╗████████╗ ██████╗ ███████╗███╗   ██╗"
echo "██║     ██║██╔════╝╚══██╔══╝██╔════╝ ██╔════╝████╗  ██║"
echo "██║     ██║███████╗   ██║   ██║  ███╗█████╗  ██╔██╗ ██║"
echo "██║     ██║╚════██║   ██║   ██║   ██║██╔══╝  ██║╚██╗██║"
echo "███████╗██║███████║   ██║   ╚██████╔╝███████╗██║ ╚████║"
echo "╚══════╝╚═╝╚══════╝   ╚═╝    ╚═════╝ ╚══════╝╚═╝  ╚═══╝"
echo "                                                   v1.0"

# Define the output XML file name
OUTPUT_XML="gamelist.xml"

# Prompt the user for the root directory to scan and store the input in ROOT_DIR
read -r -p "Enter the root directory path to scan: " ROOT_DIR

# Validate if the entered path is a valid directory
if [[ ! -d "$ROOT_DIR" ]]; then
    echo "Error: The provided path '$ROOT_DIR' is not a valid directory or does not exist."
    exit 1
fi

# Start the XML document with the root element
echo '<?xml version="1.0" encoding="UTF-8"?>' > "$OUTPUT_XML"
echo '<FolderContents>' >> "$OUTPUT_XML"

# Loop through all files recursively using 'find' in the user-specified directory
find "$ROOT_DIR" -type f | while read -r filepath; do
    
    # Extract filename from the path
    filename=$(basename "$filepath")
    
    # Write file information to the XML file, including path and name
    echo "  <File>" >> "$OUTPUT_XML"
    echo "    <Path>$filepath</Path>" >> "$OUTPUT_XML"
    echo "    <Name>$filename</Name>" >> "$OUTPUT_XML"
    echo "  </File>" >> "$OUTPUT_XML"

done

# Close the root element
echo '</FolderContents>' >> "$OUTPUT_XML"

echo "XML file '$OUTPUT_XML' generated successfully."


