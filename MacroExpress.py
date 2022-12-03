#can't update worksheet without reloading program. Find another way for user to update the worksheet.
#fix the ugliness
# create executable using setup.py to include non-python files


from tkinter import *
from tkinter import ttk
from tkinter import messagebox
import tkinter
import subprocess
import atexit
import pandas as pd
import pygsheets
import threading



#==================================Variables=====================================
global ahk, row, wkstitle
status = "no data"



client = pygsheets.authorize(service_account_file='credentials.json') #Must have this in root directory
GoogleSheetsURL = "https://docs.google.com/spreadsheets/d/1d1TgQVeTYTGplndFJyDYYDqH_0ep7mcLtrJbUvZPny0/edit?usp=sharing"
sheet = client.open_by_url(GoogleSheetsURL)
try:
    wks = sheet.worksheet_by_title(wkstitle)
except:
    try:
        wksfile = open("currentworksheet.txt", "r")
        wkstitle = wksfile.read()
        wks = sheet.worksheet_by_title(wkstitle)
    except:
        wkstitle = input("Enter sheet name exactly: ")
        wks = sheet.worksheet_by_title(wkstitle)

print(wkstitle)
#print(wks)

#==================================GUI===========================================
class Application(Frame):

    
    def __init__(self, master=None):
        
        sizex = 400 
        sizey = 480
        posx  = 250 
        posy  = 100
       
        Frame.__init__(self, master) 
        self.master.wm_geometry("%dx%d+%d+%d" % (sizex, sizey, posx, posy)) 
        self.master.title("Macro Express") 

        for r in range(12):
            self.master.rowconfigure(r, weight=1)    
        for c in range(5):
            self.master.columnconfigure(c, weight=1)

# FRAME 1
        self.Frame1 = Frame(master, bg="light grey") 
        self.Frame1.grid(row = 0, column = 0, rowspan = 1, columnspan = 4, sticky = W+E+N+S)
        self.test2_label = Label(self.Frame1, text='PREMAPPED KEYS LIST').place(x=120, y=1)

# FRAME 2
        self.Frame2 = Frame(master, bg="white")
        self.Frame2.grid(row = 1, column = 0, rowspan = 12, columnspan = 4, sticky = W+E+N+S)

        # creates text labels  in WHITE FRAME 2   
        for n in range(int(12)):
            #x = chr(ord(ch) + i)
            Label(self.Frame2,text="F"+str(n+1) + " = ").place(x=8,y=30+(30*n))        


        Label(self.Frame2,text=" A").place(x=45,y=30+(30*0))
        Label(self.Frame2,text=" B").place(x=45,y=30+(30*1))
        Label(self.Frame2,text=" D").place(x=45,y=30+(30*2))
        Label(self.Frame2,text=" E").place(x=45,y=30+(30*3))
        Label(self.Frame2,text=" F").place(x=45,y=30+(30*4))
        Label(self.Frame2,text=" G").place(x=45,y=30+(30*5))
        Label(self.Frame2,text=" H").place(x=45,y=30+(30*6))
        Label(self.Frame2,text=" I").place(x=45,y=30+(30*7))
        Label(self.Frame2,text=" J").place(x=45,y=30+(30*8))
        Label(self.Frame2,text=" L").place(x=45,y=30+(30*9))
        Label(self.Frame2,text="M").place(x=45,y=30+(30*10))
        Label(self.Frame2,text="O").place(x=45,y=30+(30*11))

        Label(self.Frame2,text="Shift + F2 = C").place(x=90,y=30+(30*1))
        Label(self.Frame2,text="Shift + F9 = K").place(x=90,y=30+(30*8))
        Label(self.Frame2,text="Shift + F11 = N").place(x=90,y=30+(30*10))
        Label(self.Frame2,text="Shift + F12 = P").place(x=90,y=30+(30*11))
        
        Label(self.Frame2,text="PgUp = Row + 1").place(x=210,y=30)
        Label(self.Frame2,text="PgDn = Row - 1").place(x=210,y=30+(30*1))          


#BLUE FRAME 3
        self.Frame3 = Frame(master, bg="light grey")
        self.Frame3.grid(row = 11, column = 0, rowspan = 1, columnspan = 6, sticky = W+E+N+S)

        # 'Average' button
        self.abutton=tkinter.Button(self.Frame3,text="Close Program",command=self.close)
        self.abutton.place(x=150, y=1)

        # text labels 
        self.test1_label2 = Label(self.Frame3, text= "Script Status: ").place(x=280, y=8)
              

#GREEN FRAME 4
        self.Frame4 = Frame(master, bg="light grey")
        self.Frame4.grid(row = 0, column = 4, rowspan = 11, columnspan = 1, sticky = W+E+N+S)


        # 'Ok' button = ok()
        self.mybutton=Button(self.Frame4,text="Update Row",command=self.update)
        self.mybutton.place(x=5,y=250)
        
        # 'Start' button starts ahk script
        self.mybutton=Button(self.Frame4,text="Start Script",command=self.start) 
        self.mybutton.place(x=8,y=360)

        # 'Stop' button stops ahk script
        self.mybutton=Button(self.Frame4,text="Stop Script",command=self.stop) 
        self.mybutton.place(x=8,y=410)
    
        # GETROW entry field for user to enter row
        self.label1 = Label(self.Frame4, text='Enter Row:', width=8)
        self.label1.place(x=10, y=200)
        text = tkinter.StringVar()
        self.getrow=Entry(self.Frame4,textvariable = text, width=10)
        self.getrow.insert(0, str(row)) # default value
        self.getrow.place(x=10,y=225)

        self.wkslabel = Label(self.Frame4, text='Worksheet:', width=8)
        self.wkslabel.place(x=10, y=15)
        
        wkstext = tkinter.StringVar()
        self.getwks=Entry(self.Frame4,textvariable = wkstext, width=10)
        self.getwks.insert(0, wkstitle) # default value
        self.getwks.place(x=10,y=45)
        
        self.mybutton2=Button(self.Frame4,text="Reload",command=self.reload)
        self.mybutton2.place(x=15,y=70)

        
        self.start()

#========================== GUI Functions ==========================
        
# The "Update row" button is tied to this function which creates the entry fields for weighted grades (grade and their associated percent value)
    def update(self):
        global row     
        row = self.getrow.get()
        Label(self.Frame3, text="CURRENT: " + str(row) + " in " + wkstitle).place(x=10, y=8)
        save()   
    
    def start(self):
        global ahk, status
        ahk = subprocess.Popen(["AutoHotKey.exe", "MacroExpress.ahk"]) # Must have AHK installed in root folder
        poll = ahk.poll()
        if(poll == None):
            status = "running"
            print("started ahk script")
        else:
            status = "None"
        Label(self.Frame3, text=(status)).place(x=350, y=8)
  
    def stop(self):
        global status
        print("stopping...")
        subprocess.Popen.terminate(ahk)
        poll = ahk.poll()
        if(poll == None):
            self.stop()
            print("stopped")
        else:
            status = "stopped"
            Label(self.Frame3, text=(status)).place(x=350, y=8)

    def reload(self):
        global wkstitle
        wkstitle = self.getwks.get()
        savewks()
        wks = sheet.worksheet_by_title(wkstitle)
        print(wks)
        self.update()
       
# The "Close" button is tied to this function.
    def close(self):
        close_program()          
        
#def updateinfo():
    #Label(app.Frame2,text="CURRENT: " + str(row) + " in " + "wkstitle").place(x=110,y=20)           

#===================================Data Handlers===========================================

def readfile1():
    with open("currentrow.txt") as savefile:
        info = savefile.readlines()

    savefile.close()

def save():
    f = open("currentrow.txt", "w")
    txtrow = row
    f.write(txtrow)
    f.close()

def savewks():
    f = open("currentworksheet.txt", "w")
    txtwks = wkstitle
    f.write(txtwks)
    f.close()

def writerow(x):
    f = open("currentrow.txt", "w")
    txtrow = row
    f.write(txtrow)
    f.close()



def load():
    global row
    rowfile = open("currentrow.txt", "r")
    try:
        row = int(rowfile.read())
    except:
        print("WARNING: You must set a worksheet and row")
        try:
            row = input("Please Enter a row: ")
            writerow(row)
        except:
            print("invalid")
            load()   


    

#===================================Window Handlers=====================================

  
def open_program(ahkfile):
    return subprocess.Popen(ahkfile)



def close_program():
    global ahk
    print("...")
    try:
        subprocess.Popen.terminate(ahk)
        poll = ahk.poll() # "None" = process still running, "1" = Process closed

    # retries to close ahk script until poll() returns a value of 1. Window will not close until poll() != "None"
        if(poll == "None"):
            close_program(ahkfile)
        else:
            print("closed")
            close_win()
    except:
        print("Goodbye")
        close_win()

        
def close_win():
    root.destroy()

def disable_event():
    pass


#==============================Google Sheets Editing======================================
def setrow(x):
    global row
    row = int(x)
    updateinfo()

def nextrow():
    global row
    row = int(row) + 1
    print("Row: " + str(row))
    updateinfo()

def previousrow():
    global row
    row = int(row) - 1
    print("Row: " + str(row))
    updateinfo()
    

def isEmpty(column):
    try:
        #check = wks.get_value(row, column)        --- Causes errors from PygSheets getvalue()
        check = ""
        if(check == ""):
            print(check)
            return True
        else:
            print(check)
            return False
    except:
        print("Warning: Pre-existing data check malfunction.")
        return True

def columnA(x):
    a = x
    if(isEmpty(1) == True):   
        wks.update_value((row,1),a)
    else:
        print("This field already has data")

def columnB(x):
    b = x
    if(isEmpty(2) == True):   
        wks.update_value((row,2),b)
    else:
        print("This field already has data")

def columnC(x):
    c = x
    if(isEmpty(3) == True):   
        wks.update_value((row,3),c)
    else:
        print("This field already has data")

def columnD(x):
    d = x
    if(isEmpty(4) == True):   
        wks.update_value((row,4),d)
    else:
        print("This field already has data")

def columnE(x):
    e = x
    if(isEmpty(5) == True):   
        wks.update_value((row,5),e)
    else:
        print("This field already has data")

def columnF(x):
    f = x
    if(isEmpty(6) == True):   
        wks.update_value((row,6),f)
    else:
        print("This field already has data")

def columnG(x):
    g = x
    if(isEmpty(7) == True):   
        wks.update_value((row,7),g)
    else:
        print("This field already has data")

def columnH(x):
    h = x
    if(isEmpty(8) == True):   
        wks.update_value((row,8),h)
    else:
        print("This field already has data")

def columnI(x):
    i = x
    if(isEmpty(9) == True):   
        wks.update_value((row,9),i)
    else:
        print("This field already has data")

def columnJ(x):
    j = x
    if(isEmpty(10) == True):   
        wks.update_value((row,10),j)
    else:
        print("This field already has data")

def columnK(x):
    k = x
    if(isEmpty(11) == True):   
        wks.update_value((row,11),k)
    else:
        print("This field already has data")

def columnL(x):
    l = x
    if(isEmpty(12) == True):   
        wks.update_value((row,12),l)
    else:
        print("This field already has data")

def columnM(x):
    m = x
    if(isEmpty(13) == True):   
        wks.update_value((row,13),m)
    else:
        print("This field already has data")        

def columnN(x):
    n = x
    if(isEmpty(14) == True):   
        wks.update_value((row,14),n)
    else:
        print("This field already has data")

def columnO(x):
    o = x
    if(isEmpty(15) == True):   
        wks.update_value((row,15),o)
    else:
        print("This field already has data")

def columnP(x):
    p = x
    if(isEmpty(16) == True):   
        wks.update_value((row,16),p)
    else:
        print("This field already has data") 
#==============================MAIN==================================


load()
root = Tk()
app = Application(master=root)
root.protocol("WM_DELETE_WINDOW", disable_event)  #disables the ability to X out of window to insure that users close the ahk script first
threading.Thread(target=app.mainloop)



