# custom-recon
A simple Python-based reconnaissance tool for passive and active information gathering.


custom-recon/
├── modules/
│   ├── whois_lookup.py
│   ├── dns_enum.py
│   ├── subdomain_enum.py
│   ├── port_scan.py
│   ├── banner_grab.py
│   ├── tech_detect.py
│   └── __init__.py
├── logger.py
├── recon.py
├── sample_report.txt
├── requirements.txt
├── README.md

python recon.py --whois --dns --subdomains --ports --banner --tech --verbose
