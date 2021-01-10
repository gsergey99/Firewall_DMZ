import os
import sys


print("********************************************************")
print("********************** SCRIPT BMON *********************")
#print("Select the interface: eth0, eth1, lo")
list_interface = ['eth0','eth1','lo']
options = ['b','a','o']
interface = str(raw_input("Select the interface: eth0, eth1, lo: "))
print("Please, select the option you want")
print("b --> Bits per second")
print("o --> Bmon in ascii output")
print("a --> Include all interfaces, enables or disables")
option = str(raw_input())
try:
    while True:
    
        if (interface in list_interface) and (option in options):
            os.system("bmon"+ " -p " + interface +" "+ option)
            break
        else:
            print("Sorry, please select the correct interface")
            interface = raw_input()
            print("Select the option you want")
            print("b --> Bits per seconds")
            print("o --> Bmon in ascii")
            print("a --> Include all interfaces, enables and disables")
            option = raw_input()

except Exception as err:
    print(err)