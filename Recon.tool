import logging

def setup_logger(verbose=False):
    level = logging.DEBUG if verbose else logging.INFO
    logging.basicConfig(
        level=level,
        format="%(asctime)s [%(levelname)s] %(message)s",
        handlers=[logging.StreamHandler()]
    )
    return logging.getLogger("recon")

import whois

def run(domain):
    try:
        data = whois.whois(domain)
        return data.text
    except Exception as e:
        return f"WHOIS error: {e}"

import dns.resolver

def run(domain):
    records = {}
    for rtype in ["A", "MX", "TXT", "NS"]:
        try:
            answers = dns.resolver.resolve(domain, rtype)
            records[rtype] = [r.to_text() for r in answers]
        except:
            records[rtype] = []
    return records


import requests

def run(domain):
    try:
        url = f"https://crt.sh/?q=%25.{domain}&output=json"
        resp = requests.get(url, timeout=10)
        data = resp.json()
        return list(set(entry['name_value'] for entry in data))
    except Exception as e:
        return [f"Subdomain error: {e}"]

import socket

def run(ip, ports=[21, 22, 80, 443, 8080]):
    open_ports = []
    for port in ports:
        try:
            with socket.create_connection((ip, port), timeout=2):
                open_ports.append(port)
        except:
            continue
    return open_ports

import socket

def run(ip, port):
    try:
        s = socket.create_connection((ip, port), timeout=2)
        s.send(b"HEAD / HTTP/1.0\r\n\r\n")
        banner = s.recv(1024)
        s.close()
        return banner.decode(errors="ignore")
    except:
        return "No banner retrieved"

def run(domain):
    # Placeholder – replace with actual detection logic if needed
    return ["MockTech1", "MockTech2"]


