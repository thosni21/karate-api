# Prérequis pour la Formation Karate (Windows)

Cette formation nécessite l'installation de plusieurs outils sur votre poste Windows. Suivez les étapes ci-dessous dans l'ordre.

## 1. Java (JDK 21)

1. Téléchargez OpenJDK depuis https://adoptium.net/
2. Choisissez la version 21 (LTS)
3. Exécutez l'installeur et suivez les instructions
4. Vérifiez l'installation en ouvrant un terminal (cmd) et tapant :
```bash
java -version
```

## 2. Maven

1. Téléchargez Maven depuis https://maven.apache.org/download.cgi
2. Décompressez l'archive dans `C:\Program Files\Apache\maven`
3. Ajoutez `C:\Program Files\Apache\maven\bin` à votre variable PATH
4. Vérifiez l'installation :
```bash
mvn -version
```

## 3. Node.js et npm

1. Téléchargez Node.js depuis https://nodejs.org/
2. Choisissez la version LTS
3. Exécutez l'installeur
4. Vérifiez l'installation :
```bash
node --version
npm --version
```

## 4. Éditeur de code (recommandé)

### Visual Studio Code
1. Téléchargez depuis https://code.visualstudio.com/
2. Installez les extensions recommandées :
   - Java Extension Pack
   - Karate Runner (si disponible)

### IntelliJ IDEA Community Edition (alternative)
1. Téléchargez depuis https://www.jetbrains.com/idea/download/
2. Choisissez la version Community (gratuite)

## 5. Git (optionnel mais recommandé)

Téléchargez Git Bash depuis https://git-scm.com/

## Vérification de l'installation

Une fois tous les outils installés, ouvrez un terminal et vérifiez :

```bash
java -version
mvn -version
node --version
npm --version
git --version
```

Vous devriez voir les versions de chaque outil s'afficher sans erreur.

## Téléchargement du projet

1. Clonez ou téléchargez le projet de formation
2. Ouvrez un terminal dans le dossier du projet
3. Exécutez les commandes suivantes pour vérifier que tout fonctionne :

```bash
# Test Maven
mvn clean test

# Installation des dépendances Node.js (pour json-server)
npm install json-server --save-dev

# Lancement du serveur de test
npx json-server src/test/resources/json-server/db.json --port 3001
```

## Support

Si vous rencontrez des problèmes lors de l'installation :
1. Vérifiez que vous avez les droits administrateur
2. Redémarrez votre ordinateur après les installations
3. Vérifiez vos variables d'environnement PATH
4. Contactez le formateur pour assistance