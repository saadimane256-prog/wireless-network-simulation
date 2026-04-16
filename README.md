# Simulation d'un Réseau Sans Fil avec OMNeT++

[English Version](README.md)

## 📋 Vue d'Ensemble

Ce projet implémente une **simulation complète d'un réseau WiFi** utilisant :
- **OMNeT++** : Simulateur de réseau discrète
- **INET Framework** : Framework de simulation de réseaux
- **Python** : Analyse et visualisation des résultats

### 🎯 Objectifs

- ✅ Simuler un réseau WiFi avec 1 point d'accès et N stations
- ✅ Comparer 3 scénarios de mobilité (Statique, Mobile, Hybride)
- ✅ Analyser l'impact sur le débit, délai et perte de paquets
- ✅ Générer un rapport détaillé avec graphiques

## 📊 Scénarios de Simulation

### Scénario 1 : Statique ⚪
Tous les nœuds sont immobiles - Positions aléatoires au démarrage

### Scénario 2 : Mobilité Totale 🔴
Tous les nœuds se déplacent aléatoirement - Vitesse : 2-5 m/s

### Scénario 3 : Hybride 🟡
50% des nœuds mobiles + 50% stationnaires - Configuration réaliste

## 🚀 Installation Rapide

```bash
git clone https://github.com/saadimane256-prog/wireless-network-simulation.git
cd wireless-network-simulation
chmod +x setup.sh
./setup.sh
```

## 📁 Structure du Projet

```
wireless-network-simulation/
├── src/                    # Code source OMNeT++
├── simulations/            # Configurations et résultats
├── analysis/               # Analyse et graphiques
└── Documentation/          # Documentation complète
```

## 📚 Documentation

- [INSTALLATION.md](INSTALLATION.md) - Guide détaillé d'installation
- [RAPPORT.md](RAPPORT.md) - Rapport scientifique complet
- [ARCHITECTURE.md](ARCHITECTURE.md) - Architecture du projet
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - Dépannage

## 📝 Licence

MIT License - Voir [LICENSE](LICENSE)