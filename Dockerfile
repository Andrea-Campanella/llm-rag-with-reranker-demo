# Use the official Ollama image
FROM ollama/ollama:latest

# Install Python, pip, and wget
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set up the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements/requirements.txt ./

# Install Python dependencies
RUN pip3 install --no-cache-dir --break-system-packages -r requirements.txt

# Pre-pull Ollama models during the build process
RUN /bin/sh -c ' \
    echo "Starting Ollama to pull models..." && \
    /bin/ollama serve & \
    OLLAMA_PID=$! && \
    (while ! wget -q -O - http://localhost:11434 > /dev/null; do echo "Waiting for ollama to be ready..."; sleep 1; done) && \
    echo "Ollama is ready. Pulling models..." && \
    ollama pull nomic-embed-text:latest && \
    ollama pull llama3.2:3b && \
    echo "Models pulled. Stopping Ollama." && \
    kill $OLLAMA_PID && \
    wait $OLLAMA_PID || true \
    '

# Pre-pull Ollama models during the build process
RUN /bin/sh -c ' \
    echo "Starting Ollama to pull models..." && \
    /bin/ollama serve & \
    OLLAMA_PID=$! && \
    (while ! wget -q -O - http://localhost:11434 > /dev/null; do echo "Waiting for ollama to be ready..."; sleep 1; done) && \
    echo "Ollama is ready. Pulling models..." && \
    ollama pull nomic-embed-text:latest && \
    ollama pull llama3.2:3b && \
    echo "Models pulled. Stopping Ollama." && \
    kill $OLLAMA_PID && \
    wait $OLLAMA_PID || true \
    '

# Copy the rest of the application code
COPY . .

# Copy the entrypoint script and make it executable
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# Expose ports for Streamlit and Ollama
EXPOSE 8501
EXPOSE 11434

# Set the entrypoint to run our script
ENTRYPOINT ["./entrypoint.sh"]
