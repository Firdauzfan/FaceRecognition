import os
from gtts import gTTS

tts = gTTS(text="Selamat Datang Firdauz Fanani di Graha Sumber Prima Elektronik", lang='id')
tts.save("AudioFile/Firdauz Fanani Welcome.mp3")

tts2 = gTTS(text="Selamat Tinggal Firdauz Fanani ,Hati hati Di jalan", lang='id')
tts2.save("AudioFile/Firdauz Fanani Goodbye.mp3")

#os.system("mpg321 AudioFile/'Firdauz Fanani Welcome.mp3' -quiet")
