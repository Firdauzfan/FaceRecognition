import json
import requests
import time
import urllib
import database
import telebot

TOKEN = "721580590:AAG-Zsna6csJTGKe8_OVms0YAQfCXwTjAUw"
bot = telebot.TeleBot(TOKEN)
URL = "https://api.telegram.org/bot{}/".format(TOKEN)

TOKEN2 = "662969455:AAHgjBFBvzz_OVybnW5q9MO9SLRRuwvqTi4"
bot2 = telebot.TeleBot(TOKEN2)
URL2 = "https://api.telegram.org/bot{}/".format(TOKEN2)

def send_message(text,chat_id,poto):
    bot.send_photo(chat_id,poto)
    bot.send_message(chat_id,text)

def send_message_kemananan(text,chat_id,poto):
    bot2.send_photo(chat_id,poto)
    bot2.send_message(chat_id,text)
