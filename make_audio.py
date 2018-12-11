import os
from gtts import gTTS

tts = gTTS(text="Selamat Datang di Graha Sumber Prima Elektronik Firdauz Fanani", lang='id')
tts.save("AudioFile/FirdauzFananiWelcome.mp3")

tts2 = gTTS(text="Selamat Tinggal Firdauz Fanani ,Hati hati Di jalan", lang='id')
tts2.save("AudioFile/FirdauzFananiGoodbye.mp3")

#os.system('mpg321 audio.mp3 -quiet')
