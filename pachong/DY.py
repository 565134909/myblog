# -*- coding:utf-8 -*-
import requests
import re
import mysql.connector


def changepage(url, total_page):
    page_group = ['https://www.dygod.net/html/gndy/jddy/index.html']
    for i in range(2, total_page + 1):
        link = re.sub('jddy/index', 'jddy/index_' + str(i), url, re.S)
        page_group.append(link)
    return page_group


def pagelink(url):
    base_url = 'https://www.dygod.net/html/gndy/jddy/'
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36'}
    req = requests.get(url, headers=headers)
    req.encoding = 'gbk'
    pat = re.compile('<a href="/html/gndy/jddy/(.*?)" class="ulink" title=(.*?)/a>', re.S)
    reslist = re.findall(pat, req.text)

    finalurl = []
    for i in range(1, 25):
        xurl = reslist[i][0]
        finalurl.append(base_url + xurl)
    return finalurl


def getdownurl(url):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36'}
    req = requests.get(url, headers=headers)
    req.encoding = 'gbk'

    pat = re.compile('<a href="ftp(.*?)">ftp', re.S)
    reslist = re.findall(pat, req.text)
    furl = 'ftp' + reslist[0]

    pat2 = re.compile('<!--Content Start-->(.*?)<!--duguPlayList Start-->', re.S)
    reslist2 = re.findall(pat2, req.text)
    reslist3 = re.sub('[<p></p>]', '', reslist2[0])
    fdetail = reslist3.split('◎')

    return (furl, fdetail)


def createtable(con, cs):
    cs.execute('create table if not exists blog_movies (film_addr varchar(1000), cover_pic varchar(1000), name varchar(100) primary key,\
     ori_name varchar(100),prod_year varchar(100), prod_country varchar(100), category varchar(100), language varchar(100), \
     subtitle varchar(100), release_date varchar(100), score varchar(100), file_format varchar(100), video_size varchar(100), \
     file_size varchar(100), film_length varchar(100), director varchar(100), actors varchar(500), profile varchar(2000),capt_pic varchar(1000))')
    con.commit()


def inserttable(con, cs, x, y):
    try:
        cs.execute(
            "insert into blog_movies values ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')" \
            % (x, y[0], y[1], y[2], y[3], y[4], y[5], y[6], y[7], y[8], y[9], y[10], y[11], y[12], y[13], y[14], y[15],
               y[16], y[17]))
    except:
        pass
    finally:
        con.commit()


if __name__ == "__main__":
    html = "https://www.dygod.net/html/gndy/jddy/index.html"
    print('你即将爬取的网站是：https://www.dygod.net/html/gndy/jddy/index.html')
    pages = input('请输入需要爬取的页数：')
    createtable
    p1 = changepage(html, int(pages))

    conn = mysql.connector.connect(host='localhost', user='root', password='123456', database='my_blog')
    cursor = conn.cursor()
    createtable(conn, cursor)
    j = 0
    for p1i in p1:
        j = j + 1
        print('正在爬取第%d页,网址是 %s ...' % (j, p1i))
        p2 = pagelink(p1i)
        for p2i in p2:
            p3, p4 = getdownurl(p2i)
            if len(p3) == 0:
                pass
            else:
                inserttable(conn, cursor, p3, p4)
    cursor.close()
    conn.close()
    print('所有页面地址爬取完毕!')