# Guide pour les participants

Ce guide explique comment chaque participant peut cloner le projet Karate API, créer son propre dépôt Git, configurer Git et travailler sur une branche dédiée.

## 1. Configurer Git (si ce n'est pas déjà fait)

```bash
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@example.com"
```

## 2. Cloner le projet de formation

```bash
git clone https://github.com/thosni21/karate-api.git
cd karate-api
```

## 3. Créer un nouveau dépôt sur votre compte GitHub

- Connectez-vous à GitHub
- Cliquez sur "New repository"
- Nommez-le par exemple `karate-api-exercices`
- Suivez les instructions pour créer le dépôt (privé ou public)

## 4. Changer le remote pour pointer vers votre dépôt personnel

```bash
git remote remove origin
git remote add origin https://github.com/votre-utilisateur/karate-api-exercices.git
```

## 5. Créer une branche pour vos exercices

```bash
git checkout -b exercices
```

## 6. Commiter et pousser vos modifications

```bash
git add .
git commit -m "Début des exercices Karate API"
git push -u origin exercices
```

## Commandes Git utiles

- `git status` : voir l’état du dépôt
- `git pull` : récupérer les dernières modifications
- `git push` : pousser vos commits
- `git checkout -b nom-branche` : créer et basculer sur une nouvelle branche

---

Chaque participant aura ainsi son propre espace de travail et pourra suivre la formation en toute autonomie.