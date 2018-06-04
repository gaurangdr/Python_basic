from ConfigParser import SafeConfigParser
import os
import subprocess

parser = SafeConfigParser()
parser.read('config.ini')

path =  parser.get('testcase', 'username') + ':' + parser.get('testcase','path')
password = parser.get('testcase', 'password')

subprocess.call(['sshpass', '-p', password, 'sftp', path])
