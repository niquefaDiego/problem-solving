import sys
import os
from bs4 import BeautifulSoup

def write_file(path_file, content):
  f = open(path_file, "w+")
  f.write(content)
  f.close()

def get_text(soup_obj):
  return soup_obj.getText().strip()

def my_quit():
  quit()

if ( len(sys.argv) > 1):
  path = sys.argv[1]
else:
  print("ERROR! No path given") 
  my_quit()

cwd = os.getcwd()
cases_path = "/".join([cwd, path])


#TODO: Validate if file exists, exit if don't exists
with open(cwd+"/tmp/problem.html") as fp:
    soup = BeautifulSoup(fp, 'html.parser')

test_cases = soup.find_all(class_="sample-tests")
if ( len(test_cases) == 0 ):
  myQuit()

inputs = test_cases[0].find_all(class_="input")
outputs = test_cases[0].find_all(class_="output")
t = len(inputs)

for i in range(t):
  file_path = cases_path + str(i)
  write_file(file_path+".in", get_text(inputs[i].pre)) 
  write_file(file_path+".out", get_text(outputs[i].pre)) 

print(t)