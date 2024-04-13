import tweepy
import os
from dotenv import load_dotenv

# Carrega as variáveis de ambiente a partir do .env
load_dotenv()

# Chaves de API e Tokens de Acesso
consumer_key = os.getenv("CONSUMER_KEY")
consumer_secret = os.getenv("CONSUMER_SECRET")
access_token = os.getenv("ACCESS_TOKEN")
access_token_secret = os.getenv("ACCESS_TOKEN_SECRET")

# Configura o cliente
client = tweepy.Client(
    consumer_key=consumer_key,
    consumer_secret=consumer_secret,
    access_token=access_token,
    access_token_secret=access_token_secret
)

# Faz o post no twitter
seu_texto = "🤖 Esse é um post do tutorial de Python com Twitter! 🤖"
response = client.create_tweet(text=seu_texto)
print("Tweet postado com sucesso!")