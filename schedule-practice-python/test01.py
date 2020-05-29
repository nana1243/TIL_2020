import schedule
import time

def job():
    print("Do Job...!!!")

def job2():
    for i in range(10):
        print(i*2)


schedule.every(1).seconds.do(job)
schedule.every(2).seconds.do(job2)
schedule.every().hour.do(job)
schedule.every().day.at("10:30").do(job)
schedule.every(3).to(10).minutes.do(job2)
schedule.every().monday.do(job)
schedule.every().wednesday.at("17:04").do(job2)
schedule.every().minute.at(":17").do(job)

while True:
    schedule.run_pending()
    time.sleep(1)