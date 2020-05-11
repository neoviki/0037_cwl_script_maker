from .utils import json_dumps, onWindows, subprocess
import os

def init_viki_logger():
    f1 = open('/tmp/script.log', "w")
    f1.write(unicode("\n################# COMMANDS #############\n"))
    f1.close()

def viki_logger(filename, lineno, commands):
    f1 = open('/tmp/script.log', "a")
    file_info = "[ " + str(filename) + ":" + str(lineno) + " ]\n"
    #f1.write(unicode(file_info))
    cmd_str = ""
    for s in commands:
        cmd_str += str(s)
        #cmd_str += ' # '
        cmd_str += ' '

    f1.write(unicode("CMD : {}\n".format(cmd_str)))
    f1.close()

