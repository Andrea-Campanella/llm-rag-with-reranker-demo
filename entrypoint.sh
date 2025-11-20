#!/bin/sh

# Start ollama serve in the background
/bin/ollama serve &

# Wait for ollama to be ready
while ! wget -q -O - http://localhost:11434 > /dev/null; do
    echo "Waiting for ollama to be ready..."
    sleep 1
done

echo "Ollama is ready. Starting Streamlit app..."
# Start the streamlit app
streamlit run app.py --server.port 8501 --server.address 0.0.0.0
