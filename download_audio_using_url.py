import requests

audio_url = "https://ipaudio6.com/wp-content/uploads/BOOKAUDIO/Be%20Obsessed%20or%20Be%20Average/12.mp3?_=12"
audio_request = requests.get(audio_url)
with open("12.mp3", 'wb') as audiofile:
    audiofile.write(audio_request.content)
