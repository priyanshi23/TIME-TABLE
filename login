from tkinter import *
import tkinter
import sqlite3
from tkinter import messagebox

def login():
    db=sqlite3.connect('timetable.sqlite')
    db.execute('CREATE TABLE IF NOT EXISTS login (username TEXT, password TEXT)')
    #db.execute("INSERT INTO login(username,password) VALUES('admin','admin')")
    db.execute("INSERT INTO login(username,password) VALUES('user','admin')")
    cursor=db.cursor()
    cursor.execute("SELECT * FROM login where username=? AND password=?",(userinput.get(),pass_input.get()))
    row=cursor.fetchone()
    if row:
        messagebox.showinfo('info','login success')

    else:
        messagebox.showinfo('info','login failed')
    cursor.connection.commit()
    db.close()

root = tkinter.Tk()
root.title('Login')
root.geometry("400x300")
padd = 20
root['padx'] = padd

label = tkinter.Label(root,text='Login Application')
label.grid(row=0, column=0,pady=20)

acctype=tkinter.Label(root, text='AccType')
acctype_input =tkinter.StringVar()
acctype.grid(row=1, column=0,pady=20)
acctype_input = tkinter.Entry(root,textvariable=acctype_input)
acctype.grid(row=1, column=1)

user=tkinter.Label(root, text='Username')
user_input=tkinter.StringVar()
user.grid(row=2, column=0,pady=20)
userinput = tkinter.Entry(root,textvariable=user_input)
userinput.grid(row=2, column=1)

password=tkinter.Label(root, text='Password')
pass_input=tkinter.StringVar()
password.grid(row=3, column=0,pady=20)
passwordinput = tkinter.Entry(root,textvariable=pass_input,show='#')
passwordinput.grid(row=3, column=1)

login_btn=tkinter.Button(text='Login',command=login)
login_btn.grid(row=4, column=1)



root.mainloop()
