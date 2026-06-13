#!/usr/bin/env python3
# pip3 install psycopg2-binary
import subprocess
import sys
from datetime import datetime

LOG_FILE = "/home/" + subprocess.getoutput("whoami") + "/devops-learn/python/postgres_check.log"

def log (msg, level="INFO"):
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    line = f"[{timestamp}]  [{level}] {msg}"
    print(line)
    with open(LOG_FILE, 'a') as f:
        f.write(line + "\n")

def check_postgres():
    # Проверяем что сервис запущен
    result = subprocess.run(
        ['psql', '-U', 'devopsuser', '-h', 'localhost', '-d', 'devopsdb', '-c', 'SELECT 1;'],
        capture_output=True, text=True,
        env={'PGPASSWORD': 'Krishna1899!!', 'PATH': '/usr/bin:/bin'}
    )
    if result.returncode == 0:
        log("PostgreSQL connection: OK ✅")
        return True
    else:
        log(f"PostgreSQL connection: FAILED ❌ - {result.stderr.strip()}", "ERROR")
        return False

if __name__ == "__main__":
    log("=== Starting PostgreSQL Health Check ===")
    ok = check_postgres()
    log(f"=== Check complete: {'OK' if ok else 'FAILED'} ===")
