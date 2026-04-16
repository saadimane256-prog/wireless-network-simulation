# Guide d'Installation Détaillé

## Table des Matières
1. [Prérequis](#prérequis)
2. [Installation d'OMNeT++](#installation-domnetpp)
3. [Installation d'INET Framework](#installation-dinet-framework)
4. [Configuration du Projet](#configuration-du-projet)
5. [Lancement des Simulations](#lancement-des-simulations)
6. [Dépannage](#dépannage)

---

## Prérequis

### Système d'exploitation
- **Linux** (Ubuntu 18.04+, Debian 10+, CentOS 7+)
- **macOS** (10.14+)
- **Windows** (WSL2 recommandé)

### Logiciels requis
- **GCC/G++** 5.4.0 ou supérieur
- **Make** 4.1 ou supérieur
- **Python** 3.6 ou supérieur
- **Git** (pour cloner le repository)

### Installation des dépendances (Ubuntu/Debian)

```bash
sudo apt-get update
sudo apt-get install -y build-essential gcc g++ make \
    python3 python3-pip git \
    openjdk-11-jdk \
    qt5-qmake qt5-default libqt5opengl5
```

### Installation des dépendances (macOS)

```bash
# Installer Homebrew si nécessaire
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installer les dépendances
brew install gcc make python3 git openjdk@11
```

---

## Installation d'OMNeT++

### Étape 1: Télécharger OMNeT++

```bash
# Créer un répertoire pour les installations
mkdir -p ~/omnetpp-workspace
cd ~/omnetpp-workspace

# Télécharger OMNeT++ 5.7 (version stable)
wget https://github.com/omnetpp/omnetpp/releases/download/omnetpp-5.7/omnetpp-5.7-src-linux.tgz

# Extraire l'archive
tar xzf omnetpp-5.7-src-linux.tgz
cd omnetpp-5.7
```

### Étape 2: Configurer et compiler

```bash
# Configuration
./configure

# Compilation (peut prendre 10-20 minutes)
make -j$(nproc)

# Vérifier l'installation
./bin/omnetpp --version
```

### Étape 3: Ajouter au PATH

```bash
# Ajouter à ~/.bashrc ou ~/.zshrc
echo 'export PATH=~/omnetpp-workspace/omnetpp-5.7/bin:$PATH' >> ~/.bashrc
echo 'export OMNETPP_PYTHON_CFLAGS="-I/usr/include/python3.8"' >> ~/.bashrc

# Recharger le shell
source ~/.bashrc
```

### Étape 4: Vérifier l'installation

```bash
omnetpp --version
opp_makemake --version
```

---

## Installation d'INET Framework

### Étape 1: Cloner INET Framework

```bash
cd ~/omnetpp-workspace
git clone https://github.com/inet-framework/inet.git inet
cd inet
git checkout v4.4.0
```

### Étape 2: Configurer INET

```bash
# Exécuter le script de configuration
./inet

# Ou manuellement:
cd src
opp_makemake -f --deep --make-so
make -j$(nproc)
```

### Étape 3: Ajouter INET au PATH

```bash
# Ajouter à ~/.bashrc ou ~/.zshrc
echo 'export INET_PROJECT=~/omnetpp-workspace/inet' >> ~/.bashrc

# Recharger le shell
source ~/.bashrc
```

### Étape 4: Vérifier l'installation

```bash
echo $INET_PROJECT
ls $INET_PROJECT/src
```

---

## Configuration du Projet

### Étape 1: Cloner le Repository

```bash
cd ~/omnetpp-workspace
git clone https://github.com/saadimane256-prog/wireless-network-simulation.git
cd wireless-network-simulation
```

### Étape 2: Exécuter le Script d'Installation

```bash
chmod +x setup.sh
./setup.sh
```

**Note**: Le script va :
- Vérifier les prérequis
- Créer la structure des répertoires
- Compiler le projet
- Installer les dépendances Python

### Étape 3: Vérifier la Compilation

```bash
# Vérifier que l'exécutable a été créé
ls -la WirelessNetwork
```

---

## Lancement des Simulations

### Option 1: Test Rapide (Recommandé)

```bash
# Lancer un test avec 10 stations en scénario statique
chmod +x quick_run.sh
./quick_run.sh
```

### Option 2: Lancer Toutes les Simulations

```bash
# Lance environ 18 configurations différentes
chmod +x run_simulations.sh
./run_simulations.sh

# Peut prendre 1-2 heures selon les performances de la machine
```

### Option 3: Lancer une Simulation Spécifique

```bash
# Syntaxe générale
./WirelessNetwork -c CONFIG_NAME -u Cmdenv -r 0 -n src:simulations

# Exemples :
./WirelessNetwork -c Static_10hosts -u Cmdenv -r 0 -n src:simulations
./WirelessNetwork -c FullMobility_5hosts -u Cmdenv -r 0 -n src:simulations
./WirelessNetwork -c Hybrid_20hosts -u Cmdenv -r 0 -n src:simulations
```

### Option 4: Interface Graphique (Debug)

```bash
# Lancer avec l'interface OMNeT++
./WirelessNetwork -c Static_10hosts -u Qtenv -r 0 -n src:simulations
```

---

## Analyse des Résultats

### Générer les Graphiques

```bash
# Analyser les résultats et générer les graphiques
python3 analysis/plot_results.py

# Les graphiques seront dans analysis/output/
```

### Fichiers de Résultats

Les résultats sont sauvegardés sous plusieurs formats :

```
results/
├── static/
│   ├── Static_5hosts.log
│   ├── Static_10hosts.log
│   └── Static_20hosts.log
├── full_mobility/
│   ├── FullMobility_5hosts.log
│   ├── FullMobility_10hosts.log
│   └── FullMobility_20hosts.log
└── hybrid/
    ├── Hybrid_5hosts.log
    ├── Hybrid_10hosts.log
    └── Hybrid_20hosts.log
```

### Consulter les Résultats

```bash
# Voir le rapport textuel
cat analysis/output/rapport_resultats.txt

# Voir les graphiques
# (ouvrir les fichiers PNG avec un visualiseur d'images)
ls analysis/output/*.png
```

---

## Dépannage

### Problème 1: "omnetpp: command not found"

**Solution:**
```bash
# Vérifier le PATH
echo $PATH

# Ajouter manuellement si nécessaire
export PATH=~/omnetpp-workspace/omnetpp-5.7/bin:$PATH
```

### Problème 2: "INET not found" lors de la compilation

**Solution:**
```bash
# Vérifier la variable INET_PROJECT
echo $INET_PROJECT

# Si vide, la définir
export INET_PROJECT=~/omnetpp-workspace/inet
```

### Problème 3: Erreur de compilation "-linet"

**Solution:**
```bash
# Compiler INET
cd $INET_PROJECT/src
make cleanall
opp_makemake -f --deep --make-so
make -j$(nproc)

# Retourner au projet
cd ~/omnetpp-workspace/wireless-network-simulation
make cleanall
make
```

### Problème 4: "No rule to make target" lors de la compilation

**Solution:**
```bash
# Nettoyer et recompiler
make clean
rm -f Makefile makefile
opp_makemake -f --deep
make
```

### Problème 5: Erreurs Python lors de l'analyse

**Solution:**
```bash
# Installer/mettre à jour les dépendances
pip3 install --upgrade matplotlib numpy
```

### Problème 6: Simulation très lente

**Conseils d'optimisation:**
- Réduire le `sim-time-limit` dans omnetpp.ini (par défaut 600s)
- Utiliser un nombre réduit de stations pour tester
- Désactiver le recording des vecteurs si non nécessaire

---

## Configurations Avancées

### Augmenter les Performances

```ini
# Dans omnetpp.ini, décommenter:
parallel-simulation = true

# Limiter le recording:
*.*.vector-recording = false
```

### Ajouter des Obstacles

```ned
# Dans WirelessNetwork.ned, ajouter:
physicalEnvironment.config = xmldoc("obstacles.xml");
```

### Modifier les Paramètres WiFi

```ini
# IEEE 802.11ac (5 GHz, 433 Mbps)
*.accessPoint.wlan[*].radio.centerFrequency = 5GHz
*.host[*].wlan[*].radio.centerFrequency = 5GHz
```

---

## Prochaines Étapes

1. ✅ Lancer `./quick_run.sh` pour tester
2. ✅ Consulter le rapport: `cat RAPPORT.md`
3. ✅ Lancer toutes les simulations: `./run_simulations.sh`
4. ✅ Analyser les résultats: `python3 analysis/plot_results.py`
5. ✅ Générer le rapport final

---

**Besoin d'aide?** Consultez la documentation officielle:
- OMNeT++: https://omnetpp.org/
- INET: https://inet.omnetpp.org/
