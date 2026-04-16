#!/bin/bash

# Configuration personnalisée du projet
# Wireless Network Simulation Configuration

echo "╔════════════════════════════════════════════╗"
echo "║   Configuration du Projet                  ║"
echo "║   Simulation de Réseau Sans Fil            ║"
echo "╚════════════════════════════════════════════╝"
echo ""

# Configuration OMNeT++
echo "Configuration OMNeT++:"
read -p "Chemin vers OMNeT++ (défaut: ~/omnetpp-workspace/omnetpp-5.7): " OMNETPP_PATH
OMNETPP_PATH=${OMNETPP_PATH:-~/omnetpp-workspace/omnetpp-5.7}

# Configuration INET
echo ""
echo "Configuration INET Framework:"
read -p "Chemin vers INET (défaut: ~/omnetpp-workspace/inet): " INET_PATH
INET_PATH=${INET_PATH:-~/omnetpp-workspace/inet}

# Paramètres de simulation
echo ""
echo "Paramètres de Simulation:"
read -p "Nombre de stations par défaut (défaut: 10): " NUM_HOSTS
NUM_HOSTS=${NUM_HOSTS:-10}

read -p "Durée de simulation en secondes (défaut: 600): " SIM_TIME
SIM_TIME=${SIM_TIME:-600}

# Créer le fichier de configuration
cat > .config << EOF
# Configuration du Projet Wireless Network Simulation
# Généré le: $(date)

# Chemins
OMNETPP_PATH=$OMNETPP_PATH
INET_PATH=$INET_PATH

# Paramètres de simulation
NUM_HOSTS=$NUM_HOSTS
SIM_TIME=$SIM_TIME

# Options de compilation
PARALLEL_SIM=false
RECORD_EVENTLOG=false

# Répertoires
RESULTS_DIR=results
ANALYSIS_DIR=analysis
EOF

echo ""
echo "✓ Configuration sauvegardée dans .config"
echo ""
echo "Résumé de la configuration:"
echo "  - Chemin OMNeT++: $OMNETPP_PATH"
echo "  - Chemin INET: $INET_PATH"
echo "  - Nombre de stations: $NUM_HOSTS"
echo "  - Durée de simulation: $SIM_TIME s"
echo ""
