
1.  **Construa a imagem Docker:**
    
    No diretório do projeto, execute o comando para construir a imagem Docker:
    
    bash
    
    Copiar código
    
    `docker build -t meu-python-ambiente .`
    
2.  **Execute o contêiner Docker:**
    
    Execute o contêiner com o comando abaixo:
    
    bash
    
    Copiar código
    
    `docker run -p 8888:8888 -v $(pwd):/app -it meu-python-ambiente`
    
    Isso iniciará um servidor Jupyter Notebook. No terminal, você verá um link para acessar o Jupyter no navegador.
    

\. Explicação Detalhada do Código
----------------------------------

O código deste projeto está contido em um arquivo Jupyter Notebook (`video_download_and_subtitles.ipynb`). Abaixo está uma visão geral do que cada parte do código faz:

### download\_video\_and\_subtitles(url)

Essa função é a principal do projeto. Ela faz o download do vídeo e das legendas, processando-as para extrair o texto limpo.

1.  **Opções de Download (`ydl_opts`)**:
    
    *   `outtmpl`: Define o nome do arquivo de saída do vídeo.
    *   `format`: Especifica a melhor qualidade disponível para download.
    *   `subtitleslangs`: Define o idioma das legendas a serem baixadas (`en` para inglês).
    *   `writesubtitles`: Indica que as legendas devem ser baixadas.
    *   `writeautomaticsub`: Tenta baixar legendas automáticas geradas pelo YouTube, se disponíveis.
2.  **Processamento das Legendas**:
    
    *   **Remoção de Tags**: As tags de formatação `< >` são removidas do texto das legendas.
    *   **Eliminação de Duplicatas**: Frases duplicadas, que podem ocorrer devido à sobreposição de legendas automáticas, são removidas.

### extract\_text\_from\_vtt(vtt\_file\_path)

Essa função é responsável por processar o arquivo `.vtt` das legendas, removendo as marcações de tempo e formatação.

1.  **Processamento**:
    *   As linhas contendo marcações de tempo são ignoradas.
    *   As tags de formatação, como `<c>` e `<00:00:00.000>`, são removidas usando expressões regulares.
    *   Frases duplicadas consecutivas são eliminadas.

### Modificação de Parâmetros Importantes

Se você deseja alterar algum comportamento do código, aqui estão os principais parâmetros que você pode modificar:

1.  **Idioma das Legendas**:
    
    *   No `ydl_opts`, altere `'subtitleslangs': ['en']` para o idioma desejado (por exemplo, `'subtitleslangs': ['es']` para espanhol).
2.  **Formato do Arquivo de Vídeo**:
    
    *   Modifique o parâmetro `'format': 'best'` para especificar um formato diferente. Por exemplo, `'format': 'mp4'` forçará o download em MP4.
3.  **Nome do Arquivo de Saída**:
    
    *   O valor de `'outtmpl'` pode ser alterado para personalizar o nome do arquivo de vídeo baixado. Por exemplo, `'outtmpl': 'meu_video.%(ext)s'`.

3\. Bibliotecas Utilizadas
--------------------------

Este projeto faz uso das seguintes bibliotecas:

Biblioteca

Versão

Descrição

`yt-dlp`

2024.x

Ferramenta de download de vídeos do YouTube.

`os`

nativo

Manipulação de caminhos e operações de sistema.

`re`

nativo

Processamento de expressões regulares.

`Jupyter`

6.x

Ferramenta para criar e compartilhar documentos que contêm código vivo.

4\. Passo a Passo para Executar o Projeto
-----------------------------------------

Siga estes passos para executar o projeto do início ao fim:

1.  **Clone o repositório ou crie o diretório do projeto:**
    
    bash
    
    Copiar código
    
    `git clone https://github.com/seu-usuario/seu-projeto.git cd seu-projeto`
    
2.  **Crie o Dockerfile** conforme descrito acima e salve-o no diretório do projeto.
    
3.  **Construa a imagem Docker:**
    
    bash
    
    Copiar código
    
    `docker build -t meu-python-ambiente .`
    
4.  **Execute o contêiner Docker:**
    
    bash
    
    Copiar código
    
    `docker run -p 8888:8888 -v $(pwd):/app -it meu-python-ambiente`
    
5.  **Acesse o Jupyter Notebook:**
    
    Abra o link fornecido no terminal para acessar o Jupyter Notebook no navegador.
    
6.  **Abra o arquivo `video_download_and_subtitles.ipynb`:**
    
    Dentro do Jupyter Notebook, abra o arquivo `video_download_and_subtitles.ipynb` e execute as células conforme necessário.
    

* * *
