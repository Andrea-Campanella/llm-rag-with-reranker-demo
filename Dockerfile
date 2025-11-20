# Use the slim Debian-based Python image for better compatibility with pre-compiled wheels
FROM python:3.11-slim

# Install mupdf runtime dependency
RUN apt-get update && apt-get install -y --no-install-recommends mupdf && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements/requirements.txt ./

# Install Python dependencies
# This should now use a pre-compiled wheel for PyMuPDF, avoiding build issues
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY app.py .

# Command to run the Streamlit app
CMD ["streamlit", "run", "app.py", "--server.port", "8501", "--server.address", "0.0.0.0"]