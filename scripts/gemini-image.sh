#!/bin/bash
# Gemini Image Generation with Retry Logic

API_KEY="AIzaSyDF9OV5eEXc-54nfFCCzrnB6RDxoRErC4w"
MAX_RETRIES=5
RETRY_DELAY=90  # 90 seconds (1.5 minutes)

if [ -z "$1" ]; then
    echo "Usage: $0 \"image description\""
    exit 1
fi

PROMPT="$1"
MODEL="gemini-2.0-flash-exp-image-generation"

echo "Generating image: $PROMPT"

for attempt in $(seq 1 $MAX_RETRIES); do
    echo "Attempt $attempt of $MAX_RETRIES..."
    
    RESPONSE=$(curl -s -X POST \
        "https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=$API_KEY" \
        -H "Content-Type: application/json" \
        -d "{\"contents\":[{\"parts\":[{\"text\":\"$PROMPT\"}]}]}" \
        2>&1)
    
    # Check for rate limit error (429 or RESOURCE_EXHAUSTED)
    if echo "$RESPONSE" | grep -q "RESOURCE_EXHAUSTED\|429\|rate limit\|quota"; then
        echo "Rate limit hit. Waiting $RETRY_DELAY seconds before retry..."
        sleep $RETRY_DELAY
        continue
    fi
    
    # Check for other errors
    if echo "$RESPONSE" | grep -q '"error"'; then
        ERROR=$(echo "$RESPONSE" | grep -o '"message":"[^"]*"' | head -1)
        echo "Error: $ERROR"
        
        # Check if it's a retryable error
        if echo "$RESPONSE" | grep -q "RESOURCE_EXHAUSTED\|429\|503\|unavailable\|RetryInfo"; then
            echo "Retryable error. Waiting $RETRY_DELAY seconds..."
            sleep $RETRY_DELAY
            continue
        fi
        
        echo "Non-retryable error. Giving up."
        echo "$RESPONSE"
        exit 1
    fi
    
    # Success - print the response
    echo "Success!"
    echo "$RESPONSE"
    exit 0
done

echo "Max retries reached. Giving up."
exit 1
