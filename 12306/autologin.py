from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import NoSuchElementException, StaleElementReferenceException, ElementNotVisibleException
import time
import requests
from urllib.parse import urlencode
from pyquery import PyQuery as pq
from Code import Code
import json

class autologin():
    def __init__(self, username, password, purpose):
        self.username = username
        self.password = password
        self.purpose = purpose
        self.login_url = 'https://kyfw.12306.cn/otn/login/init'

    def login(self):
        browser.get(self.login_url)
        try:
            input_name = browser.find_element_by_id('username')
            input_pd = browser.find_element_by_id('password')
            button = browser.find_element_by_id('loginSub')
            time.sleep(1)
            input_name.send_keys(self.username)
            input_pd.send_keys(self.password)
            c = Code(browser)       #调用验证码识别模块
            c.main()
            button.click()
            time.sleep(2)
            #等待页面跳转，如果验证码识别错误，就执行下面的while语句
            while browser.current_url == self.login_url + '#':
                c = Code(browser)
                c.main()
                button.click()
                time.sleep(2)
        except NoSuchElementException:
            self.login()

    def main(self):
        self.login()

if __name__ == '__main__':
    begin = time.time()
    browser = webdriver.Chrome()
    b = autologin('565134909@qq.com', 'XXXXXX', 'ADULT')  #账号、密码自行修改
    b.main()
    end = time.time()
    print('总耗时：%d秒' % int(end-begin))
    #browser.close()