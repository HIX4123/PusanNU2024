from gtts import gTTS

tts = gTTS(text="안녕하세요. 과제입니다", lang="ko")

tts.save("권민규_report.wav")
