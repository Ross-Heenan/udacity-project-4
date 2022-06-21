FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /mlapp

## Step 2:
# Copy source code to working directory
COPY app.py /mlapp
COPY requirements.txt /mlapp
COPY model_data/boston_housing_prediction.joblib /mlapp/model_data/
COPY model_data/housing.csv /mlapp/model_data/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install -r requirements.txt --no-cache-dir

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python", "./app.py"]
