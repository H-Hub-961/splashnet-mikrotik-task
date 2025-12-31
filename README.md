# 🚀 Network Support Engineer — Practical Exercise

> A hands-on project configuring MikroTik CHR, firewall rules, RADIUS (Ansible), Hotspot services, and GitHub documentation.

---

## 🧭 Overview
This repository demonstrates a full workflow:

- Install & configure **MikroTik CHR (OVA in VirtualBox)**
- Configure firewall rules via **Winbox**
- Deploy **RADIUS** using **Ansible**
- Configure **Hotspot on ether2**
- Export MikroTik configuration
- Organize & publish work in GitHub

---

## 📂 Repository Structure
```bash
AnsiblePlaybook/
└── RADIUS.yml
Screenshots/
├── Firewall.png
├── Ansible.png
└── RADIUS.png
chr.rsc
hosts
presentation.mp3
```

---

## ⚙️ 1️⃣ Install MikroTik CHR (OVA)

1. Download CHR OVA from MikroTik  
2. Import into **VirtualBox**  
3. Start the VM  
4. Connect using **Winbox**

---

## 🔐 2️⃣ Firewall Rule (Winbox)

Block access to:

| Destination | Port | Protocol |
|------------|------|----------|
| `1.1.1.1`  | `443` | TCP |

📷 Screenshot: `Screenshots/Firewall.png`

---

## 🐧 3️⃣ Install WSL Ubuntu + Ansible

```bash
wsl --install
sudo apt update
sudo apt install python3-pip python3-venv git -y
pip3 install ansible
ansible --version
```

Configure RADIUS Using Ansible
➤ hosts
```bash
[mikrotik]
10.28.144.142 ansible_user=admin ansible_password=abc@123 ansible_network_os=community.routeros.routeros ansible_connection=network_cli
```
➤ Playbook (AnsiblePlaybook/RADIUS.yml)
```bash
- name: Configure RADIUS on MikroTik
  hosts: mikrotik
  gather_facts: no
  tasks:
    - name: Add RADIUS client
      community.routeros.command:
        commands:
          - /radius add address=35.227.71.209 secret=testing123 service=hotspot
```

➤ Run
```bash
ansible-playbook -i hosts AnsiblePlaybook/RADIUS.yml
```

🔥 5️⃣ Hotspot Setup

Add interface → set hotspot → export config:
```bash
/export file=chr.rsc
```
🌱 6️⃣ GitHub Setup (with PAT token)
'''bash
git init
git add .
git commit -m "splashnet-mikrotik-task"
git branch -M main
git remote add origin https://github.com/<username>/<repo>.git
git push -u origin main
```





