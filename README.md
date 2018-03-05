# coding=utf-8
import sys
import os
import random
import chardet
import pickle
import pymysql as MySQLdb
""""import MySQLdb"""
from tkinter import *

os.chdir("F:\Desktop\ssssss")  

conn= MySQLdb.connect(
        host='localhost',
        port = 3306,
        user='root',
        passwd='202503',
        db ='symptoms',
        charset = 'utf8'
        )
cur = conn.cursor() 

"""reload(sys)
sys.setdefaultencoding('utf8')"""

class App(Frame):
    Frame.dialogs = []
    print(type(Frame.dialogs))
    def __init__(self,master):
        frame = Frame(master)
        frame.grid()
  
        self.hobby1 = BooleanVar()
        self.checkb = Checkbutton(frame,text = "情绪低落",variable=self.hobby1)
        self.checkb.grid(row = 1,column = 0,sticky = W)

        self.hobby2 = BooleanVar()
        self.checkb2 = Checkbutton(frame,text = "兴趣减退",variable=self.hobby2)
        self.checkb2.grid(row = 2,column = 0,sticky = W)

        self.hobby3 = BooleanVar()
        self.checkb3 = Checkbutton(frame,text = "精力下降",variable=self.hobby3)
        self.checkb3.grid(row = 3,column = 0,sticky = W)

        self.hobby4 = BooleanVar()
        self.checkb4 = Checkbutton(frame,text = "失眠",variable =self.hobby4)
        self.checkb4.grid(row = 3,column = 1,sticky = W)

        self.hobby5 = BooleanVar()
        self.checkb5 = Checkbutton(frame,text = "食欲不佳",variable =self.hobby5)
        self.checkb5.grid(row = 4,column = 2,sticky = W)

        self.action = Button(frame, text="生成文档",command=self.updata) 
        self.action.grid(column=10, row=10, sticky = E)
           
    def updata(self):
        if self.hobby1.get() == 1:
            self.checkb2.deselect() 
            sql = "select Name from Mddd"  
            cur.execute(sql)
            bs = cur.fetchall()
            bs = random.choice(bs)
            for row in bs:
                Frame.dialogs.append("%s"%row)  
                print("%s"%row)
        else:
            pass

        if self.hobby2.get() == 1:
            sql = "select Name from MDD_001_depression"  
            cur.execute(sql)
            bs = cur.fetchall()
            bs = random.choice(bs)
            for row in bs:
                Frame.dialogs.append("%s"%row) 
                print("%s"%row)
        else:
            pass
        
        i = random.randint(0, 1000000)
        i = str(i) + ".txt"
        f = open(i,"w")
        f.writelines(Frame.dialogs)
        Frame.dialogs = []

root = Tk()
root.title("病历系统")
app = App(root)
root.mainloop()

cur.close()
conn.close()
