#!/bin/bash

# Script de lancement rapide pour une simulation de test
# Wireless Network Simulation - Quick Test

echo ""
echo "════════════════════════════════════════════════════"
echo "  Test Rapide : Simulation Réseau Sans Fil"
echo "════════════════════════════════════════════════════"
echo ""

# Créer les répertoires de résultats
mkdir -p results/quick_test

echo "Lancement d'un test rapide avec configuration Static_10hosts..."
echo ""

# Compilation rapide si nécessaire
if [ ! -f "./WirelessNetwork" ]; then
    echo "Compilation du projet..."
    opp_makemake -f --deep
    make
    echo ""
fi

# Lancer une simulation simple
./WirelessNetwork -c Static_10hosts -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/quick_test/test_run.log

echo ""
echo "════════════════════════════════════════════════════"
echo "Test terminé!"
echo "Résultats sauvegardés dans: results/quick_test/"
echo "════════════════════════════════════════════════════"
echo ""
