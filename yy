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

root = Tk()
root.title("病历系统")

class App(Frame):
    Frame.dialogs = []
    print(type(Frame.dialogs))
    def __init__(self,master):
        frame = Frame(master)
        frame.grid()
  
        self.hobby10 = BooleanVar()
        self.checkb10 = Checkbutton(frame,text = "性别",variable=self.hobby10).grid(row = 1,column = 0,sticky = W)

        hobby20 = BooleanVar()
        checkb20 = Checkbutton(frame,text = "病程",variable=hobby20).grid(row = 2,column = 0,sticky = W)

        hobby30 = BooleanVar()
        checkb30 = Checkbutton(frame,text = "病期",variable=hobby30).grid(row = 3,column = 0,sticky = W)

        hobby40 = BooleanVar()
        checkb40 = Checkbutton(frame,text = "缓解期",variable =hobby40).grid(row = 3,column = 1,sticky = W)
        
        action1 = Button(frame, text="精神分裂症",command=self.MessageBox1) 
        action1.grid(column=5, row=7, sticky = W)

        action2 = Button(frame, text="抑郁症",command=self.MessageBox2) 
        action2.grid(column=5, row=6, sticky = W)
           
    

    def MessageBox1(self):  
        tl = Toplevel(height=800, width=800)  
        tl.title('精神分裂症') 
        self.hobby11 = BooleanVar()
        self.checkb11 = Checkbutton(tl,text = "被害妄想",variable=self.hobby11).grid(row = 1,column = 0,sticky = W)

        self.hobby21 = BooleanVar()
        self.checkb21 = Checkbutton(tl,text = "言语性幻听",variable=self.hobby21).grid(row = 2,column = 0,sticky = W)

        hobby3 = BooleanVar()
        checkb3 = Checkbutton(tl,text = "行为怪异",variable=hobby3).grid(row = 3,column = 0,sticky = W)

        hobby4 = BooleanVar()
        checkb4 = Checkbutton(tl,text = "失眠",variable =hobby4).grid(row = 3,column = 1,sticky = W)
    
        hobby5 = BooleanVar()
        checkb5 = Checkbutton(tl,text = "食欲不佳",variable =hobby5).grid(row = 4,column = 2,sticky = W)

        action = Button(tl, text="生成文档",command=self.updata) 
        action.grid(column=6, row=7, sticky = W)


    def MessageBox2(self):  
        tl = Toplevel(height=800, width=800)  
        tl.title('抑郁症') 
        self.hobby1 = BooleanVar()
        self.checkb = Checkbutton(tl,text = "情绪低落",variable=self.hobby1).grid(row = 1,column = 0,sticky = W)

        self.hobby2 = BooleanVar()
        self.checkb2 = Checkbutton(tl,text = "兴趣减退",variable=self.hobby2).grid(row = 2,column = 0,sticky = W)

        hobby3 = BooleanVar()
        checkb3 = Checkbutton(tl,text = "精力下降",variable=hobby3).grid(row = 3,column = 0,sticky = W)

        hobby4 = BooleanVar()
        checkb4 = Checkbutton(tl,text = "失眠",variable =hobby4).grid(row = 3,column = 1,sticky = W)
    
        hobby5 = BooleanVar()
        checkb5 = Checkbutton(tl,text = "食欲不佳",variable =hobby5).grid(row = 4,column = 2,sticky = W)

        action = Button(tl, text="生成文档",command=self.updata) 
        action.grid(column=6, row=7, sticky = W)

        
    def updata(self):
        if self.hobby1.get() == 1 and self.hobby10.get() == 1:
            """self.checkb2.deselect()"""
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


app = App(root)
root.mainloop()

cur.close()
conn.close()
