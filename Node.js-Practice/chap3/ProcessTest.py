import time
from multiprocessing import Pool
from functools import partial 

def Count(cnt,name):
    for i in range(1,100000):
        cnt+=1
        if (i%25000==0):
            print(name,": ", i)

list1=["fisrt","second","third","fourth"]

## single process start

# cnt=0
# print(" # # SINGLE PROCESSING # # ")
# start_time = time.time()
# for each in list1:
#     singleCount(cnt,each)
# print("SINGLE PROCESSING TIME : %s\n" %(time.time()-start_time))


# multi process start

from multiprocessing import Process

if __name__ == '__main__':
    for element in list1:
        p = Process(target=Count, args=(0,element ))
        p.start()
        # p.join()



