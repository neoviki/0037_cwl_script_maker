#!/usr/bin/python

import threading
import time
import os
import subprocess

threadLock = None
completed_step = 0
step_counter = 0
s1=None
s2=None
s3=None
s4=None


class CWLThread (threading.Thread):
   def __init__(self, threadID, name, step):
      threading.Thread.__init__(self)
      self.threadID = threadID
      self.name = name
      self.step = step
   def run(self):
       global s1, s2, s3, s4, threadLock, completed_step, step_counter
       while True:
           if self.step > 1:
               if completed_step >= 1:
                   break
               else:
                   time.sleep(1)
                   continue
           else:
               break

       execute_command(self.name, self.step)
    
def execute_command(threadName, step):
    global s1, s2, s3, s4, threadLock, completed_step, step_counter
    print "[EXECUTING]        STEP : %d        THREAD : %s"%(step, threadName)

    command = ""

    if step == 1:
        command = s1
    if step == 2:
        command = s2
    if step == 3:
        command = s3
    if step == 4:
        command = s4

    #with open(os.devnull, 'w')  as nullfd:
    #    p = subprocess.Popen(command, stdout=nullfd, stderr=nullfd)

    p = subprocess.Popen(command)
 
    process_running = None
    while p.poll() == process_running:
        time.sleep(1)
        continue

    threadLock.acquire()
    completed_step = step
    step_counter+=1
    threadLock.release()

def init():
    global s1, s2, s3, s4, threadLock, completed_step, step_counter
    print "[INITILIZING]"

    s1 = ['bash','./ssh1.sh']
    s2 = ['bash','./ssh2.sh']
    s3 = ['bash','./ssh3.sh']
    s4 = ['bash','./ssh4.sh']
    command = ['bash','./init.sh']

    #with open(os.devnull, 'w')  as nullfd:
    #    p = subprocess.Popen(command, stdout=nullfd, stderr=nullfd)

    p = subprocess.Popen(command)
    
    process_running = None
    while p.poll() == process_running:
        time.sleep(1)
        continue

def threaded_execute(): 
    global s1, s2, s3, s4, threadLock, completed_step, step_counter

    threadLock = threading.Lock()
    threads = []

    # Create new threads
    thread1 = CWLThread(1, "thread1", 1)
    thread2 = CWLThread(2, "thread2", 2)
    thread3 = CWLThread(3, "thread3", 3)
    thread4 = CWLThread(4, "thread4", 4)


    # Start new Threads
    thread1.start()
    thread2.start()
    thread3.start()
    thread4.start()

    # Add threads to thread list
    threads.append(thread1)
    threads.append(thread2)
    threads.append(thread3)
    threads.append(thread4)

    # Wait for all threads to complete
    for t in threads:
        t.join()

    while step_counter < 4:
        time.sleep(1)
        continue

    print "[COMPLETED]    [ALL TASKS]"

def main():
    init()
    threaded_execute()

if __name__=="__main__":
    main()
