from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import urllib.request
import threading
import mysql.connector
import os
import datetime
from selenium.webdriver.common.keys import Keys
import time


class MySpider:
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows; U; Windows NT 6.0 x64; en-US; rv:1.9pre)Gecko/2008072421 Minefield/3.0.2pre"}
    imagePath = "download"

    def startUp(self, url, key):
        chrome_options = Options()
        chrome_options.add_argument('--headless')
        chrome_options.add_argument('--disable-gpu')
        self.driver = webdriver.Chrome(options=chrome_options)
        self.threads = []
        self.No = 0
        self.imgNo = 0

        try:
            self.con = mysql.connector.connect(host='localhost', user='root', password='123456', database='my_blog')
            self.cursor = self.con.cursor()
            try:
                self.cursor.execute("drop table blog_phones")
            except:
                pass
            try:
                sql = "create table blog_phones (mNo varchar(32) primary key,mMark varchar(256),mPrice varchar(32),mNote varchar(1024),mFile varchar(256))"
                self.cursor.execute(sql)
            except:
                pass
        except Exception as err:
            print(err)
        try:
            if not os.path.exists(MySpider.imagePath):
                os.mkdir(MySpider.imagePath)
            images = os.listdir(MySpider.imagePath)
            for img in images:
                s = os.path.join(MySpider.imagePath, img)
                os.remove(s)
        except Exception as err:
            print(err)

        self.driver.get(url)
        keyInput = self.driver.find_element_by_id("key")
        keyInput.send_keys(key)
        keyInput.send_keys(Keys.ENTER)

    def closeUp(self):
        try:
            self.con.commit()
            self.con.close()
            self.driver.close()
        except Exception as err:
            print(err);

    def insertDB(self, mNo, mMark, mPrice, mNote, mFile):
        try:
            self.cursor.execute("insert into blog_phones values ('%s', '%s', '%s', '%s', '%s')" \
                                % (mNo, mMark, mPrice, mNote, mFile))
        except Exception as err:
            print(err)

    def showDB(self):
        try:
            con = mysql.connector.connect(host='localhost', user='root', password='123456', database='my_blog')
            cursor = con.cursor()
            print("%-8s %-16s %-8s %-16s %s" % ("No", "Mark", "Price", "Image", "Note"))
            cursor.execute("select mNo,mMark,mPrice,mFile,mNote from blog_phones order by mNo")
            rows = cursor.fetchall()
            for row in rows:
                print("%-8s %-16s %-8s %-16s %s" % (row[0], row[1], row[2], row[3], row[4]))
            con.close()
        except Exception as err:
            print(err)

    def download(self, src1, src2, mFile):
        data = None
        if src1:
            try:
                req = urllib.request.Request(src1, headers=MySpider.headers)
                resp = urllib.request.urlopen(req, timeout=400)
                data = resp.read()
            except:
                pass
        if not data and src2:
            try:
                req = urllib.request.Request(src2, headers=MySpider.headers)
                resp = urllib.request.urlopen(req, timeout=400)
                data = resp.read()
            except:
                pass
        if data:
            fobj = open(MySpider.imagePath + "\\" + mFile, "wb")
            fobj.write(data)
            fobj.close()
            print("download ", mFile)

    def processSpider(self):
        try:
            time.sleep(1)
            print(self.driver.current_url)
            lis = self.driver.find_elements_by_xpath("//div[@id='J_goodsList']//li[@class='gl-item']")
            for li in lis:
                try:
                    src1 = li.find_element_by_xpath(".//div[@class='p-img']//a//img").get_attribute("src")
                except:
                    src1 = ""
                try:
                    src2 = li.find_element_by_xpath(".//div[@class='p-img']//a//img").get_attribute("data-lazy-img")
                except:
                    src2 = ""
                try:
                    price = li.find_element_by_xpath(".//div[@class='p-price']//i").text
                except:
                    price = "0"
                try:
                    note = li.find_element_by_xpath(".//div[@class='p-name p-name-type-2']//em").text
                    mark = note.split(" ")[0]
                    mark = mark.replace("爱心东东\n", "")
                    mark = mark.replace(",", "")
                    note = note.replace("爱心东东\n", "")
                    note = note.replace(",", "")
                except:
                    note = ""
                    mark = ""
                self.No = self.No + 1
                no = str(self.No)
                while len(no) < 6:
                    no = "0" + no
                print(no, mark, price)
                if src1:
                    src1 = urllib.request.urljoin(self.driver.current_url, src1)
                    p = src1.rfind(".")
                    mFile = no + src1[p:]
                elif src2:
                    src2 = urllib.request.urljoin(self.driver.current_url, src2)
                    p = src2.rfind(".")
                    mFile = no + src2[p:]
                if src1 or src2:
                    T = threading.Thread(target=self.download, args=(src1, src2, mFile))
                    T.setDaemon(False)
                    T.start()
                    self.threads.append(T)
                else:
                    mFile = ""
                self.insertDB(no, mark, price, note, mFile)
            try:
                self.driver.find_element_by_xpath("//span[@class='p-num']//a[@class='pn-next disabled']")
            except:
                nextPage = self.driver.find_element_by_xpath("//span[@class='p-num']//a[@class='pn-next']")
                nextPage.click()
                self.processSpider()
        except Exception as err:
            print(err)

    def executeSpider(self, url, key):
        starttime = datetime.datetime.now()
        print("Spider starting......")
        self.startUp(url, key)
        self.processSpider()
        self.closeUp()
        for t in self.threads:
            t.join()
        print("Spider completed......")
        endtime = datetime.datetime.now()
        elapsed = (endtime - starttime).seconds
        print("Total ", elapsed, " seconds elapsed")


url = "http://www.jd.com"
spider = MySpider()
while True:
    print("1.爬取")
    print("2.显示")
    print("3.退出")
    s = input("请选择(1,2,3):")
    if s == "1":
        spider.executeSpider(url, "手机")
    elif s == "2":
        spider.showDB()
    elif s == "3":
        break
