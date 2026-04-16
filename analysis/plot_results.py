#!/usr/bin/env python3
"""
Script d'analyse et de visualisation des résultats de simulation
Wireless Network Simulation Analysis
"""

import os
import sys
import numpy as np
import matplotlib.pyplot as plt
from pathlib import Path

class SimulationAnalyzer:
    """Classe pour analyser les résultats de simulation"""
    
    def __init__(self, results_dir="results"):
        self.results_dir = results_dir
        self.scenarios = {}
        self.load_results()
    
    def load_results(self):
        """Charger les fichiers de résultats"""
        print("Chargement des résultats...")
        
        # Pour cette démonstration, on crée des données simulées
        # En pratique, vous liriez les fichiers .sca et .vec d'OMNeT++
        self.scenarios = {
            'Static': {
                '5hosts': {
                    'throughput': 4.5,
                    'delay': 0.015,
                    'packetloss': 0.2
                },
                '10hosts': {
                    'throughput': 4.2,
                    'delay': 0.018,
                    'packetloss': 0.5
                },
                '20hosts': {
                    'throughput': 3.8,
                    'delay': 0.025,
                    'packetloss': 1.2
                }
            },
            'FullMobility': {
                '5hosts': {
                    'throughput': 4.1,
                    'delay': 0.022,
                    'packetloss': 0.8
                },
                '10hosts': {
                    'throughput': 3.5,
                    'delay': 0.035,
                    'packetloss': 2.5
                },
                '20hosts': {
                    'throughput': 2.8,
                    'delay': 0.058,
                    'packetloss': 5.2
                }
            },
            'Hybrid': {
                '5hosts': {
                    'throughput': 4.3,
                    'delay': 0.019,
                    'packetloss': 0.5
                },
                '10hosts': {
                    'throughput': 3.9,
                    'delay': 0.028,
                    'packetloss': 1.2
                },
                '20hosts': {
                    'throughput': 3.2,
                    'delay': 0.045,
                    'packetloss': 3.1
                }
            }
        }
    
    def plot_throughput_comparison(self):
        """Comparer le débit pour différents scénarios"""
        fig, axes = plt.subplots(1, 3, figsize=(15, 5))
        fig.suptitle('Comparaison du Débit (Throughput) - Mbps', fontsize=16, fontweight='bold')
        
        scenarios = ['Static', 'FullMobility', 'Hybrid']
        hosts_config = ['5hosts', '10hosts', '20hosts']
        colors = ['#2ecc71', '#3498db', '#e74c3c']
        
        for idx, scenario in enumerate(scenarios):
            throughputs = [self.scenarios[scenario][config]['throughput'] for config in hosts_config]
            axes[idx].bar(hosts_config, throughputs, color=colors)
            axes[idx].set_title(f'Scénario : {scenario}')
            axes[idx].set_ylabel('Débit (Mbps)')
            axes[idx].set_ylim(0, 5)
            axes[idx].grid(axis='y', alpha=0.3)
            
            # Ajouter les valeurs sur les barres
            for i, v in enumerate(throughputs):
                axes[idx].text(i, v + 0.1, f'{v:.2f}', ha='center', fontweight='bold')
        
        plt.tight_layout()
        plt.savefig('analysis/output/throughput_comparison.png', dpi=300, bbox_inches='tight')
        print("✓ Graphique débit sauvegardé")
        plt.close()
    
    def plot_delay_comparison(self):
        """Comparer le délai pour différents scénarios"""
        fig, axes = plt.subplots(1, 3, figsize=(15, 5))
        fig.suptitle('Comparaison du Délai End-to-End - ms', fontsize=16, fontweight='bold')
        
        scenarios = ['Static', 'FullMobility', 'Hybrid']
        hosts_config = ['5hosts', '10hosts', '20hosts']
        colors = ['#2ecc71', '#3498db', '#e74c3c']
        
        for idx, scenario in enumerate(scenarios):
            delays = [self.scenarios[scenario][config]['delay'] * 1000 for config in hosts_config]
            axes[idx].bar(hosts_config, delays, color=colors)
            axes[idx].set_title(f'Scénario : {scenario}')
            axes[idx].set_ylabel('Délai (ms)')
            axes[idx].grid(axis='y', alpha=0.3)
            
            for i, v in enumerate(delays):
                axes[idx].text(i, v + 0.5, f'{v:.2f}', ha='center', fontweight='bold')
        
        plt.tight_layout()
        plt.savefig('analysis/output/delay_comparison.png', dpi=300, bbox_inches='tight')
        print("✓ Graphique délai sauvegardé")
        plt.close()
    
    def plot_packetloss_comparison(self):
        """Comparer la perte de paquets"""
        fig, axes = plt.subplots(1, 3, figsize=(15, 5))
        fig.suptitle('Comparaison du Taux de Perte de Paquets - %', fontsize=16, fontweight='bold')
        
        scenarios = ['Static', 'FullMobility', 'Hybrid']
        hosts_config = ['5hosts', '10hosts', '20hosts']
        colors = ['#2ecc71', '#3498db', '#e74c3c']
        
        for idx, scenario in enumerate(scenarios):
            losses = [self.scenarios[scenario][config]['packetloss'] for config in hosts_config]
            axes[idx].bar(hosts_config, losses, color=colors)
            axes[idx].set_title(f'Scénario : {scenario}')
            axes[idx].set_ylabel('Taux de Perte (%)')
            axes[idx].grid(axis='y', alpha=0.3)
            
            for i, v in enumerate(losses):
                axes[idx].text(i, v + 0.1, f'{v:.2f}', ha='center', fontweight='bold')
        
        plt.tight_layout()
        plt.savefig('analysis/output/packetloss_comparison.png', dpi=300, bbox_inches='tight')
        print("✓ Graphique perte de paquets sauvegardé")
        plt.close()
    
    def plot_scenario_comparison(self):
        """Comparer les trois scénarios sur un seul graphique"""
        fig, axes = plt.subplots(1, 3, figsize=(16, 5))
        
        hosts_config = ['5hosts', '10hosts', '20hosts']
        scenarios = ['Static', 'FullMobility', 'Hybrid']
        x = np.arange(len(scenarios))
        width = 0.25
        
        # Débit
        throughputs = [
            [self.scenarios[s]['5hosts']['throughput'] for s in scenarios],
            [self.scenarios[s]['10hosts']['throughput'] for s in scenarios],
            [self.scenarios[s]['20hosts']['throughput'] for s in scenarios]
        ]
        
        for i, config in enumerate(hosts_config):
            axes[0].bar(x + i*width, throughputs[i], width, label=config)
        
        axes[0].set_title('Débit (Mbps)', fontweight='bold')
        axes[0].set_ylabel('Débit (Mbps)')
        axes[0].set_xticks(x + width)
        axes[0].set_xticklabels(scenarios)
        axes[0].legend()
        axes[0].grid(axis='y', alpha=0.3)
        
        # Délai
        delays = [
            [self.scenarios[s]['5hosts']['delay'] * 1000 for s in scenarios],
            [self.scenarios[s]['10hosts']['delay'] * 1000 for s in scenarios],
            [self.scenarios[s]['20hosts']['delay'] * 1000 for s in scenarios]
        ]
        
        for i, config in enumerate(hosts_config):
            axes[1].bar(x + i*width, delays[i], width, label=config)
        
        axes[1].set_title('Délai End-to-End (ms)', fontweight='bold')
        axes[1].set_ylabel('Délai (ms)')
        axes[1].set_xticks(x + width)
        axes[1].set_xticklabels(scenarios)
        axes[1].legend()
        axes[1].grid(axis='y', alpha=0.3)
        
        # Perte de paquets
        losses = [
            [self.scenarios[s]['5hosts']['packetloss'] for s in scenarios],
            [self.scenarios[s]['10hosts']['packetloss'] for s in scenarios],
            [self.scenarios[s]['20hosts']['packetloss'] for s in scenarios]
        ]
        
        for i, config in enumerate(hosts_config):
            axes[2].bar(x + i*width, losses[i], width, label=config)
        
        axes[2].set_title('Taux de Perte de Paquets (%)', fontweight='bold')
        axes[2].set_ylabel('Taux de Perte (%)')
        axes[2].set_xticks(x + width)
        axes[2].set_xticklabels(scenarios)
        axes[2].legend()
        axes[2].grid(axis='y', alpha=0.3)
        
        fig.suptitle('Comparaison Globale des Trois Scénarios', fontsize=16, fontweight='bold')
        plt.tight_layout()
        plt.savefig('analysis/output/scenario_comparison.png', dpi=300, bbox_inches='tight')
        print("✓ Graphique comparaison globale sauvegardé")
        plt.close()
    
    def generate_report(self):
        """Générer un rapport texte des résultats"""
        report_path = 'analysis/output/rapport_resultats.txt'
        
        with open(report_path, 'w', encoding='utf-8') as f:
            f.write("=" * 70 + "\n")
            f.write("RAPPORT D'ANALYSE DES RÉSULTATS\n")
            f.write("Simulation de Réseau Sans Fil avec OMNeT++\n")
            f.write("=" * 70 + "\n\n")
            
            for scenario in ['Static', 'FullMobility', 'Hybrid']:
                f.write(f"\n{'='*70}\n")
                f.write(f"SCÉNARIO : {scenario}\n")
                f.write(f"{'='*70}\n\n")
                
                for config in ['5hosts', '10hosts', '20hosts']:
                    data = self.scenarios[scenario][config]
                    f.write(f"Configuration : {config}\n")
                    f.write(f"  - Débit (Throughput)      : {data['throughput']:.2f} Mbps\n")
                    f.write(f"  - Délai moyen             : {data['delay']*1000:.2f} ms\n")
                    f.write(f"  - Taux de perte           : {data['packetloss']:.2f} %\n\n")
        
        print(f"✓ Rapport sauvegardé : {report_path}")
    
    def run_all_analysis(self):
        """Exécuter toutes les analyses"""
        os.makedirs('analysis/output', exist_ok=True)
        
        print("\n" + "="*50)
        print("GÉNÉRATION DES GRAPHIQUES D'ANALYSE")
        print("="*50 + "\n")
        
        self.plot_throughput_comparison()
        self.plot_delay_comparison()
        self.plot_packetloss_comparison()
        self.plot_scenario_comparison()
        self.generate_report()
        
        print("\n" + "="*50)
        print("ANALYSE TERMINÉE!")
        print("Les graphiques sont sauvegardés dans 'analysis/output/'")
        print("="*50 + "\n")

def main():
    """Fonction principale"""
    analyzer = SimulationAnalyzer()
    analyzer.run_all_analysis()

if __name__ == "__main__":
    main()
