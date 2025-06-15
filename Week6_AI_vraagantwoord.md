
# Week 6 - Hybrid Cloud Deployment (Azure + ESXi)

## ✅ Wat is gelukt

### Azure VM deployment via Terraform
- Ubuntu 22.04 LTS VM succesvol uitgerold in Azure via `main.tf`.
- Resource group `S1202816`, public IP en NIC zijn hergebruikt en geconfigureerd.
- SSH-sleutels voor gebruiker `testuser` correct geplaatst via Terraform.
- Docker is automatisch geïnstalleerd via een Ansible Galaxy-role op de Azure VM.
- De Hello World-container draait succesvol op de Azure VM.
- CI/CD pipeline (GitHub Actions) triggert een Ansible playbook voor updates en container-deployment.

### CI/CD Pipeline
- GitHub Actions is ingericht.
- Lokale GitHub Actions runner is succesvol geïnstalleerd op de Linux-machine.
- CI/CD pipeline triggert automatische playbook-uitvoering bij een `git push`.

---

## ❌ Wat is (nog) niet gelukt

### ESXi VM deployment via Terraform
- Poging tot deployment mislukt vanwege:
  - Gebruik van een standalone ESXi in plaats van vCenter → foutmelding `this operation is only supported on vCenter`.
  - VM-template `ubuntu-2404-template` is niet aanwezig in omgeving → `not found` error.
  - Misconfiguraties in `variables.tf` → bitwise syntaxfouten zoals `1~variable`.

### Docker op ESXi VM
- De ESXi VM is nog niet gedeployed, dus Docker kan nog niet worden geïnstalleerd of getest.
- Hello World container is daardoor nog niet op ESXi getest of gedemonstreerd.

---

## 🔧 Wat moet ik uitleggen in de video

### Scenario
> “We hebben een hybride cloud deployment gerealiseerd met een Azure VM en een geplande ESXi VM. Op de Azure VM is alles volledig geautomatiseerd: van resource deployment tot het installeren van Docker en het deployen van een container. We gebruiken CI/CD via GitHub Actions om alles up-to-date te houden.”

### SSO of SSH-koppeling
> “De gebruiker `testuser` is op beide omgevingen aangemaakt (voor ESXi gepland). De SSH-key is automatisch uitgerold waardoor `testuser` vanuit de ESXi-VM naar de Azure VM kan inloggen (te demonstreren zodra ESXi-VM werkt).”

### CI/CD Pipeline
> “De pipeline voert automatisch Ansible-playbooks uit die Docker installeren en een Hello World container starten. Dit is zichtbaar via GitHub Actions en op de Azure VM.”

---

## 📋 Toelichting beoordelingscriteria

| Criterium | Stand van zaken |
|----------|----------------|
| **1. Complete deployment** | Azure-kant voltooid, ESXi faalt door vCenter-afhankelijkheid |
| **2. Gebruik stof uit lessen** | Terraform, Ansible, CI/CD toegepast |
| **3. Volledig geautomatiseerd** | Azure volledig geautomatiseerd |
| **4. SSH werkend tussen omgevingen** | Nog niet mogelijk zonder ESXi VM |
| **5. Docker geïnstalleerd via Galaxy-role** | Gelukt op Azure |
| **6. Hello World container draait** | Alleen op Azure |
| **7. Video met uitleg** | Wordt opgenomen incl. scenario, CI/CD en tekortkomingen |

---

## 📌 Verbeteracties (optioneel)
- ESXi VM opnieuw proberen te deployen met standalone-configuratie zonder vCenter vereiste.
- Alternatief handmatig opzetten van de ESXi VM voor demonstratiedoeleinden.
- Docker installatie en Hello World container via Ansible playbook testen op de ESXi VM.
