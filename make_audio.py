import os
from gtts import gTTS

tts = gTTS(text="Selamat Datang Alimul Hakim di Graha Sumber Prima Elektronik", lang='id')
tts.save("AudioFile/Alimul Hakim Welcome.mp3")

tts2 = gTTS(text="Selamat Tinggal Alimul Hakim ,Hati hati Di jalan", lang='id')
tts2.save("AudioFile/Alimul Hakim Goodbye.mp3")

#os.system("mpg321 AudioFile/'Firdauz Fanani Welcome.mp3' -quiet")
