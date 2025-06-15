Overzicht

Deze opdracht betreft het automatisch deployen van een hybride cloudomgeving, bestaande uit een Azure VM en een ESXi VM. Beide draaien Docker met een "Hello World" container. Authenticatie gebeurt met SSH via een Ansible-geconfigureerde gebruiker testuser. De infrastructuur wordt uitgerold met Terraform en geconfigureerd met Ansible. CI/CD pipelines zorgen voor automatische deployments.

Structuur van de repositories

Azure VM: in repo week6 op GitHub: https://github.com/naimd66/week6.git

(Nog te maken) Aparte repo voor ESXi VM-deployment (aanbevolen voor netheid en versiebeheer)

Benodigde Tools

Terraform

Ansible

GitHub Actions (CI/CD)

Azure CLI

ESXi 8.0 omgeving (Skylab)

Ansible Galaxy

Uitgevoerde stappen

✅ Azure VM deployment

Gebruikt Terraform voor het uitrollen van een Ubuntu 22.04 VM.

Public IP, NIC, subnet en VNet worden geautomatiseerd aangemaakt of gekoppeld aan bestaande resources.

De gebruiker testuser is geconfigureerd met SSH-public key.

Docker is via Ansible geïnstalleerd met een eigen Ansible Galaxy role.

Een "Hello World" container draait op deze VM.

✅ SSH verbinding vanuit ESXi VM

SSH key is automatisch geplaatst via Ansible.

Handmatige validatie van SSH-sessie is succesvol gelukt.

❌ ESXi VM deployment

Deployment via Terraform is nog niet gelukt door:

Fout in het herkennen van de compute_cluster (geen vCenter beschikbaar).

Template ubuntu-2404-template bestaat niet in omgeving.

Plan: Deployment via andere Terraform config zonder compute_cluster, of via GUI en later opnemen in Ansible-playbook.

❌ Docker container op ESXi VM

Omdat de VM nog niet draait, is deze stap uitgesteld.

Plan: na deployment van VM Docker installeren via dezelfde Ansible Galaxy role en container starten.

✅ Ansible Galaxy Role

Docker-installatierole is lokaal gemaakt.

Deze is nog niet gepubliceerd op Galaxy.

Plan: publiceren via ansible-galaxy login en ansible-galaxy import.

Video: Wat moet je laten zien

Deel 1 – Werkend systeem

De Azure VM is gedeployed met Terraform.

testuser kan via SSH verbinden vanaf de ESXi-VM (of een andere Linux VM met private key).

Docker draait op de Azure VM, inclusief een "Hello World" container (te tonen met docker ps).

Deel 2 – Uitleg in video

Leg het volgende uit:

Wat is de opdracht van week 6? (Hybride cloud setup, Docker container deployment, CI/CD, Ansible + Terraform)

Wat heb je gedaan?

Repo structuur, wat er in Terraform zit, wat er in Ansible zit

Waarom je een aparte repo voor ESXi wilt gebruiken (versiebeheer)

Wat is er gelukt?

Azure kant volledig geautomatiseerd

Docker en Hello World container draait

CI/CD op GitHub werkt

Wat is nog niet gelukt?

Deployment van de ESXi VM door vCenter issues

Docker op ESXi (nog geen VM)

Docker role nog niet op Galaxy

Koppeling met theorie:

Infrastructure as Code = desired state (VM’s en config in code gedefinieerd)

Declarative programming = je beschrijft wat je wil, niet hoe

CI/CD = automatische deployment bij wijzigingen

Commando's

Terraform:

terraform init
terraform apply -auto-approve

Ansible (voorbeeld):

ansible-playbook -i inventory playbooks/docker-install.yml

SSH test:

ssh testuser@<public-ip-of-azure-vm>

Prompt en AI-gebruik

Zie markdown-bestand week6_ai_trace.md voor alle gebruikte prompts en gegenereerde antwoorden.

week6_ai_trace.md

AI Prompts en Antwoorden

Prompt

kan je mij dan helpen met de docker-role publiceren naar galaxy en hello world container starten op esxi?

Antwoord (samengevat)

Gebruik ansible-galaxy init docker_role om role te genereren.

Voeg taken toe in tasks/main.yml om Docker te installeren.

Maak account op Galaxy, koppel GitHub, importeer repo.

Start container met Ansible taak of via:

docker run -d --name hello-world-container hello-world

Prompt

kan je voor mij readme.md file aanmaken of zeggen wat ik erbij moet inzetten voor deze week en een markdown bestand voor wat er in de chat is gevraagd en beantwoord. zie beoordelingsdocument

Antwoord

Zie huidige bestand – README.md en week6_ai_trace.md zijn opgeleverd conform beoordelingsmatrix.
