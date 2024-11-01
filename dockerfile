# Step 1: Use an official Python runtime as a parent image
FROM python:3.12-slim

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the current directory contents into the container at /app
COPY . /app

# Step 4: Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Collect static files (if needed)
RUN python manage.py collectstatic --noinput

# Step 6: Expose port 8000 to the outside world
EXPOSE 6002

# Step 7: Run migrations and start the Django server
# CMD ["python", "manage.py", "migrate"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:6002"]
