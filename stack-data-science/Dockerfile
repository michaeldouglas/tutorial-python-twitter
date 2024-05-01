# Utilizaremos a imagem oficial do Anaconda
FROM continuumio/anaconda3

# Criador
LABEL org.opencontainers.image.authors="michaeldouglas010790@gmail.com"

# Configurando o acesso ao Jupyter
RUN mkdir /opt/notebooks
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py

# Jupyter escuta na porta 8888
EXPOSE 8888

# Adicionando o volume
VOLUME $PWD/notebooks:/opt/notebooks

# Executar o notebook Jupyter como processo principal do Docker
CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--no-browser", "--NotebookApp.token=''"]