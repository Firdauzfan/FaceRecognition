import os
from gtts import gTTS

tts = gTTS(text="Selamat Datang Teoderikus Ferdian di Graha Sumber Prima Elektronik", lang='id')
tts.save("AudioFile/Teoderikus Ferdian Welcome.mp3")

tts2 = gTTS(text="Selamat Tinggal Teoderikus Ferdian ,Hati hati Di jalan", lang='id')
tts2.save("AudioFile/Teoderikus Ferdian Goodbye.mp3")

#os.system("mpg321 AudioFile/'Firdauz Fanani Welcome.mp3' -quiet")
