# Imagem da aplicação
FROM python:3.13.5-alpine3.21

# Install dependencies
WORKDIR /app

# Create a virtual environment
RUN python3 -m venv .venv
ENV PATH="/app/.venv/bin:$PATH"

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copiar o restante do código da aplicação
COPY . .

# Expose the application port
EXPOSE 8000
# MARVEL acesso ao certificado na primeira aula
# Define the command to start the application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload" ]
