# Guide de Dépannage Avancé

## Problèmes Courants et Solutions

### 1. Problèmes de Compilation

#### Erreur: "No such file or directory: opp_makemake"

```bash
# Vérifier que OMNeT++ est dans le PATH
echo $PATH

# Si absent, ajouter:
export PATH=$HOME/omnetpp-workspace/omnetpp-5.7/bin:$PATH
