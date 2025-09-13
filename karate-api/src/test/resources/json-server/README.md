# json-server pour formation Karate

Ce projet utilise [json-server](https://github.com/typicode/json-server) pour simuler l'API REST de jsonplaceholder avec de vraies opérations DELETE et UPDATE.

## Installation

json-server version 0.17.4 est installé localement dans le projet (cette version retourne des ID numériques) :
```bash
npm install json-server@0.17.4 --save-dev
```

## Lancement du serveur

Depuis la racine du projet karate-api :
```bash
npx json-server src/test/resources/json-server/db.json --port 3001
```

L'API sera disponible sur http://localhost:3001

## Endpoints disponibles
- `/posts`
- `/comments`
- `/albums`
- `/photos`
- `/todos`
- `/users`

Tu peux faire des requêtes GET, POST, PUT, PATCH, DELETE sur ces endpoints.

## Exemple de requête DELETE
```bash
curl -X DELETE http://localhost:3001/posts/1
```

## Exemple de requête UPDATE
```bash
curl -X PUT -H "Content-Type: application/json" -d '{"title":"Nouveau titre","body":"Texte modifié","userId":1}' http://localhost:3001/posts/2
```