Feature: JOUR 2 - MATIN - Introduction aux méthodes POST (1h30)
  # 🎯 Objectifs:
  # - Comprendre la différence entre GET et POST
  # - Créer ses premières ressources
  # - Maîtriser les codes 200 vs 201

  Background:
    * url 'http://localhost:3001'

  Scenario: Comprendre POST vs GET
    # 📝 RAPPEL: Hier on faisait du GET (récupérer)
    Given path '/posts/1'
    When method GET
    Then status 200
    # ☝️ GET = récupérer des données existantes

    # 📝 AUJOURD'HUI: POST = créer de nouvelles données  
    Given path '/posts'
    And request { "title": "Nouveau post", "body": "Contenu", "userId": 1 }
    When method POST
    Then status 201
    # ☝️ POST = envoyer des données pour créer quelque chose
    # 💡 Explication: 201 = "Created" (quelque chose a été créé)

  Scenario: Mon premier POST détaillé
    # 📝 OBJECTIF: Comprendre chaque partie d'une création
    Given path '/posts'
    And request 
    """
    {
      "title": "Mon premier post de test",
      "body": "Ceci est le contenu de mon premier post créé avec Karate",
      "userId": 1
    }
    """
    When method POST
    Then status 201
    # 💡 Explication: 
    # - path = où envoyer (/posts = collection)
    # - request = les données à envoyer (JSON)
    # - method POST = créer
    # - status 201 = succès de création

  Scenario: Vérifier ce qui a été créé
    # 📝 OBJECTIF: Contrôler les données retournées
    Given path '/posts'
    And request 
    """
    {
      "title": "Test de vérification",
      "body": "Je vais vérifier ce que l'API me renvoie",
      "userId": 1
    }
    """
    When method POST
    Then status 201
    And match response.title == "Test de vérification"
    And match response.body == "Je vais vérifier ce que l'API me renvoie"
    And match response.userId == 1
    And match response.id == '#number'
    # L'API génère un ID automatiquement
    * print 'Post créé avec l\'ID:', response.id
    # 💡 Explication: L'API nous renvoie ce qui a été créé + un ID généré

  Scenario: Utiliser des variables pour les données
    # 📝 OBJECTIF: Préparer les données à l'avance
    * def monNouveauPost = 
    """
    {
      "title": "Post créé avec une variable",
      "body": "Les variables rendent le code plus lisible",
      "userId": 1
    }
    """
    
    Given path '/posts'
    And request monNouveauPost
    When method POST
    Then status 201
    And match response.title == monNouveauPost.title
    # 💡 Explication: 'def' crée une variable réutilisable

  Scenario: Créer plusieurs posts rapidement
    # 📝 OBJECTIF: Voir qu'on peut créer autant qu'on veut
    * def posts = 
    """
    [
      { "title": "Post 1", "body": "Premier post", "userId": 1 },
      { "title": "Post 2", "body": "Deuxième post", "userId": 1 },
      { "title": "Post 3", "body": "Troisième post", "userId": 2 }
    ]
    """
    
    # Premier post
    Given path '/posts'
    And request posts[0]
    When method POST
    Then status 201
    
    # Deuxième post
    Given path '/posts'
    And request posts[1]
    When method POST
    Then status 201
    
    # 💡 Explication: On peut créer autant d'éléments qu'on veut

  Scenario: Headers et Content-Type
    # 📝 OBJECTIF: Comprendre les headers HTTP
    Given path '/posts'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request 
    """
    {
      "title": "Post avec headers explicites",
      "body": "J'ai spécifié les headers manuellement",
      "userId": 1
    }
    """
    When method POST
    Then status 201
    # 💡 Explication: 
    # - Content-Type = type de données qu'on envoie
    # - Accept = type de réponse qu'on veut recevoir