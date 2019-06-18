import requests
import sys
import time
from PIL import Image
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains
from io import BytesIO
from selenium import webdriver
import pyautogui
import base64
import re
from bs4 import BeautifulSoup
import urllib
import pyperclip
import os



class Code():
    def __init__(self, browser):
        self.browser = browser
        self.verify_url = 'http://littlebigluo.qicp.net:47720/'     #验证码识别网址，返回识别结果
        self.pic_dir = 'H:\\12306\\captcha.jpg'
        if(os.path.exists(self.pic_dir)):
            os.remove(self.pic_dir)

        #确定验证码的位置
    def get_position(self):
        #session = requests.Session()  # 自动的处理cookie
        #headers = {
         #   'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36'
        #}
        #session.headers.update(headers)

        # 伪装成浏览器
        # 1. 访问 获取cookie
        #cookie_url = 'https://kyfw.12306.cn/otn/login/conf'
        #response = session.get(cookie_url)
        # 2. 下载验证码
        #captcha_url = 'https://kyfw.12306.cn/passport/captcha/captcha-image64?login_site=E&module=login&rand=sjrand&1541686714134&callback=jQuery19109992892609908492_1541686371355&_=1541686371356'
       # response = session.get(captcha_url)
       # tp=self.browser.find_element_by_class_name('touclick-image')
        #src = tp.get_attribute('src')
        #img_base64 = re.findall(r'"image":"(.*?)"', src)[0]
        # img_base64 = 'data:image/jpg;base64,' + img_base64
        # 转换成二级制数据
        #img_bytes = base64.b64decode(img_base64)
        # 写到文件
        #with open('captcha.jpg', 'wb') as f:
            #f.write(img_bytes)
        #print(src)
        #urllib.request.urlretrieve(src, 'captcha.jpg')
        # get the session cookie
        #cookie = [item["name"] + "=" + item["value"] for item in self.browser.get_cookies()]
        # print cookie
        #cookiestr = ';'.join(item for item in cookie)
        #print(cookiestr)
        #time.sleep(3)

       element = self.browser.find_element_by_class_name('touclick-image')
       time.sleep(2)
       #element.get_attribute("src")
       action = ActionChains(self.browser).move_to_element(element)
       action.context_click(element)
       action.perform()
        # 发送键盘按键，根据不同的网页，
        # 右键之后按对应次数向下键，
        # 找到图片另存为菜单
       pyautogui.typewrite('v')
        # 单击图片另存之后等1s敲回车
       time.sleep(3)
       pyperclip.copy(self.pic_dir)
       pyautogui.hotkey('ctrlleft', 'V')
       pyautogui.typewrite(['enter'])
       time.sleep(3)

        #从截取的网页，裁剪出验证码图片，并保存到本地




        #验证码解析
    def parse_img(self):
       # url = "http://littlebigluo.qicp.net:47720/"
        #response = requests.request("POST", url, data={"type": "1"}, files={'pic_xxfile': open('captcha.jpg', 'rb')})
        #result = []
        #print(response.text)
        #for i in re.findall("<B>(.*)</B>", response.text)[0].split(" "):
           # result.append(int(i) - 1)
        #self.result = resultH:\12306\captcha.jpg
       # print(result)
        time.sleep(3)
        files = {'file': open('captcha.jpg', 'rb')}             #打开保存到本地的验证码图片
        response = requests.request("POST", self.verify_url, data={"type": "1"},files={'pic_xxfile': open('captcha.jpg', 'rb')})
        print(response.text)
        try:
            num = response.text.split('<B>')[1].split('<')[0]
            print('验证码识别成功！图片位置：%s' % num)
            if int(num):
                return [int(num)]
        except ValueError:
            num = list(map(int, num.split()))
            return num
        except IndexError:
            print("请稍后再试")
            sys.exit()

        #识别
       # 结果num都以列表形式返回，方便后续验证码的点击

        #实现验证码自动点击
    def move(self):
        num = self.parse_img()
        try:
            element = self.browser.find_element_by_class_name('touclick-img-par')
            for i in num:
                if i <= 4:
                    ActionChains(self.browser).move_to_element_with_offset(element,40+72*(i-1),73).click().perform()
                else :
                    i -= 4
                    ActionChains(self.browser).move_to_element_with_offset(element,40+72*(i-1),145).click().perform()
        except:
            print('元素不可选！')

    def main(self):
        self.get_position()
        self.move()