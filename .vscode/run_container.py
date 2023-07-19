import os
import sys


print(f"COMMAND: docker exec -it dbt {sys.argv[1]} {sys.argv[2]}")
os.system(f"docker exec -it dbt {sys.argv[1]} {sys.argv[2]}")