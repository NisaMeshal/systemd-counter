from datetime import datetime
import sys
import time
import signal
import os

os.chmod('/tmp/currentCount.out', 664)
f = open('/tmp/currentCount.out', 'w')

counter = 0

def term_handler(signum, frame):
    f.write('Received SIGTERM, exiting \n')
    print("", flush=True)
    f.close()
    sys.exit()
    
signal.signal(signal.SIGTERM, term_handler)

def incremet(counter):
    return counter + 1

while True:
    print('Nisa: ' + datetime.now().strftime('%Y-%m-%d %H:%M:%S') + f' #{counter}')
    f.write('Nisa: ' + datetime.now().strftime('%Y-%m-%d %H:%M:%S') + f' #{counter} \n')
    counter = incremet(counter)
    time.sleep(1)