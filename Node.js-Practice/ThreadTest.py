import threading
from time import sleep, ctime

def Count(cnt,name):
    for i in range(1,100000):
        cnt+=1
        if (i%25000==0):
            print(name,": ", i)

list1=["fisrt","second","third","fourth"]


if __name__ == '__main__':
    for element in list1:
        t = threading.Thread(target=Count, args=(0,element ))
        t.start()
        t.join()
