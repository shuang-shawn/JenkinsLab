# Use Python base image  
FROM python:3.9-slim  

# Set the working directory  
WORKDIR /app  

# Copy project files  
COPY . .  

# Install dependencies  
# RUN pip install -r requirements.txt  

# Expose the port  
EXPOSE 8080  

# Command to run the application  
CMD ["python3", "app.py"]  
