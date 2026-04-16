#!/bin/bash

# Script de lancement de toutes les simulations
# Wireless Network Simulation

echo "========================================="
echo "Simulation de Réseau Sans Fil"
echo "OMNeT++ avec INET Framework"
echo "========================================="

# Créer le dossier des résultats
mkdir -p results
mkdir -p results/static
mkdir -p results/full_mobility
mkdir -p results/hybrid

# Compiler si nécessaire
if [ ! -f "WirelessNetwork" ]; then
    echo ""
    echo "Compilation du projet..."
    opp_makemake -f --deep
    make
fi

echo ""
echo "========================================="
echo "SCÉNARIO 1 : STATIQUE (5 stations)"
echo "========================================="
./WirelessNetwork -c Static_5hosts -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/static/Static_5hosts.log

echo ""
echo "========================================="
echo "SCÉNARIO 1 : STATIQUE (10 stations)"
echo "========================================="
./WirelessNetwork -c Static_10hosts -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/static/Static_10hosts.log

echo ""
echo "========================================="
echo "SCÉNARIO 1 : STATIQUE (20 stations)"
echo "========================================="
./WirelessNetwork -c Static_20hosts -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/static/Static_20hosts.log

echo ""
echo "========================================="
echo "SCÉNARIO 2 : MOBILITÉ TOTALE (5 stations)"
echo "========================================="
./WirelessNetwork -c FullMobility_5hosts -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/full_mobility/FullMobility_5hosts.log

echo ""
echo "========================================="
echo "SCÉNARIO 2 : MOBILITÉ TOTALE (10 stations)"
echo "========================================="
./WirelessNetwork -c FullMobility_10hosts -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/full_mobility/FullMobility_10hosts.log

echo ""
echo "========================================="
echo "SCÉNARIO 2 : MOBILITÉ TOTALE (20 stations)"
echo "========================================="
./WirelessNetwork -c FullMobility_20hosts -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/full_mobility/FullMobility_20hosts.log

echo ""
echo "========================================="
echo "SCÉNARIO 3 : HYBRIDE (5 stations)"
echo "========================================="
./WirelessNetwork -c Hybrid_5hosts -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/hybrid/Hybrid_5hosts.log

echo ""
echo "========================================="
echo "SCÉNARIO 3 : HYBRIDE (10 stations)"
echo "========================================="
./WirelessNetwork -c Hybrid_10hosts -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/hybrid/Hybrid_10hosts.log

echo ""
echo "========================================="
echo "SCÉNARIO 3 : HYBRIDE (20 stations)"
echo "========================================="
./WirelessNetwork -c Hybrid_20hosts -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/hybrid/Hybrid_20hosts.log

echo ""
echo "========================================="
echo "VARIATIONS DE TAILLE DE PAQUETS (Static)"
echo "========================================="
./WirelessNetwork -c Static_512B -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/static/Static_512B.log
./WirelessNetwork -c Static_1024B -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/static/Static_1024B.log
./WirelessNetwork -c Static_2048B -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/static/Static_2048B.log

echo ""
echo "========================================="
echo "VARIATIONS DE TAILLE DE PAQUETS (Full Mobility)"
echo "========================================="
./WirelessNetwork -c FullMobility_512B -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/full_mobility/FullMobility_512B.log
./WirelessNetwork -c FullMobility_1024B -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/full_mobility/FullMobility_1024B.log
./WirelessNetwork -c FullMobility_2048B -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/full_mobility/FullMobility_2048B.log

echo ""
echo "========================================="
echo "VARIATIONS DE TAILLE DE PAQUETS (Hybrid)"
echo "========================================="
./WirelessNetwork -c Hybrid_512B -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/hybrid/Hybrid_512B.log
./WirelessNetwork -c Hybrid_1024B -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/hybrid/Hybrid_1024B.log
./WirelessNetwork -c Hybrid_2048B -u Cmdenv -r 0 -n src:simulations 2>&1 | tee results/hybrid/Hybrid_2048B.log

echo ""
echo "========================================="
echo "Toutes les simulations sont terminées!"
echo "Résultats sauvegardés dans le dossier 'results/'"
echo "========================================="
