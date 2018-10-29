import json
import requests
import time
import urllib
import database
import telebot

TOKEN = "625701624:AAGvxucdxeUhSb8Cj5qFuYt0Ppf9vg4Ua5U"
bot = telebot.TeleBot(TOKEN)
URL = "https://api.telegram.org/bot{}/".format(TOKEN)

def send_message(text, chat_id, poto):
    bot.send_photo(chat_id, poto)
    bot.send_message(chat_id, text)
