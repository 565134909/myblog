from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse

class phones(models.Model):
    mNo = models.CharField(primary_key=True,max_length=32)
    mMark = models.CharField(max_length=256)
    mPrice = models.CharField(max_length=32)
    mNote = models.CharField(max_length=1024)
    mFile = models.CharField(max_length=256)

class movies(models.Model):
   film_addr=models.CharField(max_length=1000)
   cover_pic=models.CharField(max_length=1000)
   name=models.CharField(primary_key=True,max_length=100)
   ori_name=models.CharField(max_length=100)
   prod_year=models.CharField(max_length=100)
   prod_country=models.CharField(max_length=100)
   category=models.CharField(max_length=100)
   language=models.CharField(max_length=100)
   subtitle=models.CharField(max_length=100)
   release_date=models.CharField(max_length=100)
   score=models.CharField(max_length=100)
   file_format=models.CharField(max_length=100)
   video_size=models.CharField(max_length=100)
   file_size=models.CharField(max_length=100)
   film_length=models.CharField(max_length=100)
   director=models.CharField(max_length=100)
   actors=models.CharField(max_length=500)
   profile=models.CharField(max_length=2000)
   capt_pic=models.CharField(max_length=1000)

class Category(models.Model):
    name = models.CharField('分类',max_length=128)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '博客分类'
        verbose_name_plural = verbose_name


class Tag(models.Model):
    name = models.CharField('标签', max_length=128)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '博客标签'
        verbose_name_plural = verbose_name


class Entry(models.Model):
    title = models.CharField('文章标题',max_length=128)
    author = models.ForeignKey(User,verbose_name='作者',on_delete=models.CASCADE)
    img = models.ImageField(upload_to='blog_img',null=True,blank=True,verbose_name='博客配图')
    body = models.TextField('正文',)
    abstract = models.TextField('摘要',max_length=256,null=True,blank=True)
    visiting = models.PositiveIntegerField('访问量',default=0)
    category = models.ManyToManyField('Category',verbose_name='博客分类')
    tags = models.ManyToManyField('Tag',verbose_name='标签')
    created_time = models.DateTimeField('创建时间',auto_now_add=True)
    modifyed_time = models.DateTimeField('修改时间',auto_now=True)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        #获取当前博客详情页的url
        return reverse("blog:blog_detail",kwargs={"blog_id":self.id})

    def increase_visiting(self):
        #访问量加1
        self.visiting += 1
        self.save(update_fields=['visiting'])

    class Meta:
        ordering = ['-created_time']
        verbose_name = '博客正文'
        verbose_name_plural = verbose_name
