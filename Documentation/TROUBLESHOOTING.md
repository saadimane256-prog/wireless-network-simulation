# Guide de Dépannage Avancé

## Problèmes Courants et Solutions

### 1. Problèmes de Compilation

#### Erreur: "No such file or directory: opp_makemake"


# Vérifier que OMNeT++ est dans le PATH
echo $PATH

# Si absent, ajouter:
export PATH=$HOME/omnetpp-workspace/omnetpp-5.7/bin:$PATH

2. Problèmes de Runtime
Erreur: "No suitable network found"
Vérifier que WirelessNetwork.ned est dans src/
Vérifier la configuration dans omnetpp.ini
Vérifier les noms des modules
Simulation s'arrête immédiatement
INI
# Augmenter la durée de simulation dans omnetpp.ini:
sim-time-limit = 600s
Pas de résultats générés
bash
# Vérifier que recording est activé:
*.vector-recording = true
*.scalar-recording = true
3. Problèmes de Performance
Simulation très lente
bash
# Limiter le recording:
*.vector-recording = false
*.scalar-recording = true

# Ou exécuter en mode batch sans interface:
./WirelessNetwork -c Static_10hosts -u Cmdenv
Utilisation mémoire élevée
bash
# Réduire la durée ou le nombre de stations:
*.numHosts = 5
sim-time-limit = 300s
4. Problèmes d'Analyse Python
Erreur: "ModuleNotFoundError: No module named 'matplotlib'"
bash
pip3 install matplotlib numpy
Graphiques non générés
bash
# Vérifier que les résultats existent:
ls results/*/

# Vérifier le script d'analyse:
python3 -m analysis.plot_results
Débogage
Mode Verbose
bash
./WirelessNetwork -c Static_10hosts -u Cmdenv -r 0 \
  -n src:simulations 2>&1 | tee debug.log
Avec GDB (Debug)
bash
gdb -ex run -ex "bt" --args \
  ./WirelessNetwork -c Static_10hosts -u Cmdenv
Logging Amélioré
Ajouter dans omnetpp.ini:

INI
[Config Debug]
extends = Static_10hosts
record-eventlog = true
eventlog-recording-modes = all
Ressources d'Aide
OMNeT++ Manual: https://doc.omnetpp.org/
INET Framework Manual: https://inet.omnetpp.org/
Stack Overflow: Tag omnetpp
GitHub Issues: https://github.com/saadimane256-prog/wireless-network-simulation/issues
Code

---

## **📄 FICHIER 28 : ARCHITECTURE.md (Documentation architecture)**

```markdown name=ARCHITECTURE.md
# Architecture du Projet

## Vue d'ensemble
