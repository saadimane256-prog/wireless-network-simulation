#!/bin/bash

# Script d'installation et configuration du projet
# Wireless Network Simulation Setup

echo ""
echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║   Installation: Simulation de Réseau Sans Fil avec OMNeT++   ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo ""

# Vérifier les prérequis
echo "[1/5] Vérification des prérequis..."
echo ""

# Vérifier OMNeT++
if ! command -v omnetpp &> /dev/null; then
    echo "❌ OMNeT++ n'est pas installé"
    echo "   Téléchargez-le depuis: https://omnetpp.org/"
    exit 1
fi

echo "✓ OMNeT++ trouvé: $(omnetpp --version 2>/dev/null || echo 'Version inconnue')"

# Vérifier INET
if [ ! -d "$INET_PROJECT" ]; then
    echo "⚠ INET Framework n'est pas configuré"
    echo "   Assurez-vous que INET_PROJECT est défini:"
    echo "   export INET_PROJECT=/path/to/inet"
fi

# Vérifier Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 n'est pas installé"
    exit 1
fi

echo "✓ Python 3 trouvé: $(python3 --version)"
echo ""

# Créer la structure des dossiers
echo "[2/5] Création de la structure des répertoires..."
echo ""

mkdir -p src
mkdir -p simulations
mkdir -p simulations/results
mkdir -p simulations/results/static
mkdir -p simulations/results/full_mobility
mkdir -p simulations/results/hybrid
mkdir -p analysis
mkdir -p analysis/output

echo "✓ Répertoires créés"
echo ""

# Compiler le projet
echo "[3/5] Compilation du projet OMNeT++..."
echo ""

if [ -f "Makefile" ]; then
    make clean
fi

opp_makemake -f --deep

if ! make; then
    echo "❌ Erreur lors de la compilation"
    exit 1
fi

echo "✓ Compilation réussie"
echo ""

# Configuration des droits d'exécution
echo "[4/5] Configuration des droits d'exécution..."
echo ""

chmod +x run_simulations.sh
chmod +x setup.sh
chmod +x analysis/plot_results.py

echo "✓ Droits configurés"
echo ""

# Installation des dépendances Python
echo "[5/5] Installation des dépendances Python..."
echo ""

python3 -m pip install matplotlib numpy --quiet

if [ $? -eq 0 ]; then
    echo "✓ Dépendances Python installées"
else
    echo "⚠ Certaines dépendances Python n'ont pu être installées"
fi

echo ""
echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║              Installation Terminée avec Succès!              ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo ""
echo "Prochaines étapes:"
echo "  1. Lancer les simulations: ./run_simulations.sh"
echo "  2. Analyser les résultats: python3 analysis/plot_results.py"
echo "  3. Consulter le rapport: cat RAPPORT.md"
echo ""
