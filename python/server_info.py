#!/usr/bin/env python3
import subprocess
import json
from datetime import datetime
 
def get_server_info():
    info = {}
    
    # Имя сервера
    info['hostname'] = subprocess.getoutput('hostname')
    
    # Дата и время
    info['timestamp'] = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    
    # Использование диска
    disk = subprocess.getoutput("df -h / | tail -1")
    disk_parts = disk.split()
    info['disk'] = {
        'total': disk_parts[1],
        'used': disk_parts[2],
        'available': disk_parts[3],
        'use_percent': disk_parts[4]
    }
    
    # RAM
    ram = subprocess.getoutput("free -m | grep Mem")
    ram_parts = ram.split()
    info['ram'] = {
        'total_mb': ram_parts[1],
        'used_mb': ram_parts[2],
        'free_mb': ram_parts[3]
    }
    
    # Процессы
    info['process_count'] = subprocess.getoutput("ps aux | wc -l")
    
    return info
 
if __name__ == "__main__":
    data = get_server_info()
    print(json.dumps(data, indent=2, ensure_ascii=False))

