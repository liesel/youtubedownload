# Use uma imagem base oficial do Python
FROM python:3.11-slim

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Instale as dependências necessárias para o Python e o sistema operacional
RUN apt-get update && apt-get install -y \
    build-essential \
    && apt-get clean

# Atualize o pip para a versão mais recente
RUN pip install --upgrade pip

# Instale o yt-dlp
RUN pip install yt-dlp

# Instale o Jupyter Notebook
RUN pip install jupyter

# Expõe a porta padrão do Jupyter Notebook
EXPOSE 8888

# Comando para iniciar o Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]





