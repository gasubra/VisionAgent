FROM python:3.10

# Expose port you want your app on
EXPOSE 8501

# Copy app code and set working directory
COPY . /app
WORKDIR /app

# Upgrade pip and install requirements
COPY examples/chat/requirements.txt ./requirements.txt
RUN  python3.10 -m pip install --upgrade pip
RUN  python3.10 -m pip install -r requirements.txt
RUN pip install -U pip
RUN pip install -r requirements.txt
RUN pip install vision_agent


RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Set env variables
ENV OPENAI_API_KEY=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

# Run
ENTRYPOINT ["streamlit", "run", "./examples/chat/app.py", "--server.port=8501", "--server.address=0.0.0.0"]
#CMD ["examples/chat/app.py"]
