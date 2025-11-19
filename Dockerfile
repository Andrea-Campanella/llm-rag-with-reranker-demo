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
