from flask_restful import Api
from flask import Flask, render_template, redirect, url_for, request
import requests
import json


app = Flask(__name__)
api = Api(app)





@app.route('/')
def index() :
    return render_template('index.html')

@app.route('/oauth')
def oauth():
    code = str(request.args.get('code'))
    resToken = getAccessToken(RESTAPI,str(code))

    res = getuserInfo(access_token=resToken.get("access_token"))


    return resToken

def getAccessToken(clientId, code) :  # 세션 코드값 code 를 이용해서 ACESS TOKEN과 REFRESH TOKEN을 발급 받음
    url = "https://kauth.kakao.com/oauth/token"
    payload = "grant_type=authorization_code"

    payload += "&client_id=" + clientId

    payload += "&redirect_url=http%3A%2F%2Flocalhost%3A5000%2Foauth&code=" + code


    headers = {
        'Content-Type' : "application/x-www-form-urlencoded",
        'Cache-Control' : "no-cache",
    }
    reponse = requests.request("POST",url,data=payload, headers=headers)
    access_token = json.loads(((reponse.text).encode('utf-8')))
    return access_token


# 이름, 가져오기 성공
def getuserInfo(access_token):
    profile_request = requests.get("https://kapi.kakao.com/v2/user/me", headers={"Authorization": f"Bearer {access_token}"})
    profile_json = profile_request.json()
    kakao_account = profile_json.get("kakao_account")
    kakao_name = kakao_account.get('profile').get('nickname')
    email = kakao_account.get("email", None)
    print(kakao_name)
    print(email)

    return profile_json



if __name__ == '__main__':
    app.run(debug=True)