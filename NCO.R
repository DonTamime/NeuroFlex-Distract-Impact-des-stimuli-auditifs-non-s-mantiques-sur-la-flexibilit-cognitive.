# -------------------------------------------------------------------
# TP Neurosciences cognitives - Analyse des données de flexibilité cognitive
# Étudiants : Piel Manuel & Tamime Nadim
# -------------------------------------------------------------------

# Chargement des données expérimentales (issue de PsyToolkit, format CSV)
test <- read.table("donnees.csv", header = TRUE, sep = ";")

# -------------------------------------------------------------------
#Nous allons commencer par un test de shapiro, afin de saovir si nos données suivent une loi normal, avec H0 qui nous indique que l'on suit une loi normal et H1 qui nous indique l'inverse. 
# H0 : la variable suit une loi normale ; H1 : non
# Résultat utile pour choisir entre test paramétrique ou non-paramétrique
by(test$temps.de.reponse..millisecondes., test$condition, shapiro.test)

kruskal.test(test$temps.de.reponse..millisecondes. ~ test$condition, data = test)
pairwise.wilcox.test(test$temps.de.reponse..millisecondes. , test$condition, p.adjust.method = "bonferroni")

boxplot(test$temps.de.reponse..millisecondes. ~ test$condition)
boxplot(test$temps.de.reponse..millisecondes. ~ test$condition,
        data = test,
        xlab = "Condition",
        ylab = "Temps de réponse (ms)",
        main = "Comparaison des temps de réponse selon la condition",
        col = c("skyblue", "salmon"))
#Le willcox test nous confirme qu'il y a une difference entre le temps de reaction selon les condition (confirmer par la p-value qui est de 0.021. 

taux_erreur = ifelse(taux_erreur)

by(taux_erreur, test$condition, shapiro.test)

pairwise.wilcox.test(taux_erreur , test$condition)

boxplot(taux_erreur ~ test$condition)

test$erreur_binaire <- ifelse(test$statut..1.correct..2.faux..3.lent == 2, 1, 0)
table(test$condition, test$erreur_binaire)
chisq.test(table(test$condition, test$erreur_binaire))


table(test$condition, test$nom.du.bloc)  # Voir les effectifs croisés
chisq.test(table(test$condition, test$nom.du.bloc))  # Test du Chi²

mod <- lm(test$temps.de.reponse..millisecondes. ~ test$condition * test$nom.du.bloc, data = test)
summary(mod)

interaction.plot(x.factor = test$condition,
                 trace.factor = test$nom.du.bloc,
                 response = test$temps.de.reponse..millisecondes.,
                 fun = mean,
                 type = "b",
                 legend = TRUE,
                 ylab = "Temps de réponse (ms)",
                 xlab = "Condition",
                 trace.label = "Nom du bloc") 

mod_switch <- lm(temps.de.reponse..millisecondes. ~ commutation..1...essai.repete..2...essai.de.commutation., data = test)
summary(mod_switch)

boxplot(temps.de.reponse..millisecondes. ~ commutation..1...essai.repete..2...essai.de.commutation., 
        data = test,
        col = c("#ADD8E6", "#FFA07A"),
        names = c("Essai répété", "Essai de commutation"),
        main = "Coût de la commutation",
        ylab = "Temps de réponse (ms)") 
#FIN 




