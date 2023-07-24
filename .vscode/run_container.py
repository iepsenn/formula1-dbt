import os
import sys


command = "docker exec -it dbt"
for idx, arg in enumerate(sys.argv):
    command = command + f" {sys.argv[idx]}" if idx > 0 else command

print(f"COMMAND: {command}")
os.system(command)