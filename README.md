# NeuroFlex-Distract-Impact-des-stimuli-auditifs-non-s-mantiques-sur-la-flexibilit-cognitive.
TP Neurosciences (L3 BMCP - Rennes)

On a testé l'impact de bips sonores sur la flexibilité mentale. 
En gros, est-ce qu'on galère plus à switcher de tâche quand on se fait polluer les oreilles par des sons aléatoires ? 


Ce qu'on retient des stats :

Le switch entre deux tâches (forme vs remplissage) coûte super cher en temps de réponse : on perd 387.89 ms en moyenne (p<2.2e−16). Par contre, la distraction sonore rajoute une latence de 100 ms environ, mais sans nous faire faire plus de fautes. On reste autour de 13% d'erreurs, peu importe la condition.

Y'a sûrement un effet de fatigue parce que le test avec distraction était toujours passé après le témoin.

Matos et analyse :
- Test : Multitasking via PsyToolkit (touches b et n pour les formes/remplissage).
- Distraction : Bips aléatoires balancés dans un casque fermé.
- Data : Tout est mouliné sur RStudio avec des tests de Wilcoxon et une régression linéaire pour le coût de commutation.

Les fichiers :
/Scripts : Le code R (NCO.R) pour sortir les boxplots et la p-value.
/Donnees : Le CSV brut de PsyToolkit.
/Rapport : Le compte-rendu final (PDF) où on discute de l'onde P300 et du cortex préfrontal.

Tamime Nadim & Manuel Piel
