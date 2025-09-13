Feature: JOUR 2 - APRÈS-MIDI - Variables et fonctions JavaScript (2h)
  # 🎯 Objectifs:
  # - Maîtriser les variables Karate
  # - Utiliser des fonctions JavaScript
  # - Chaîner des requêtes avec variables
  # - Manipuler les données dynamiquement

  Background:
    * url 'http://localhost:3001'

  Scenario: Variables de base avec def
    # 📝 OBJECTIF: Créer et utiliser des variables
    * def myTitle = "Titre stocké dans une variable"
    * def myUserId = 1
    * def myContent = "Contenu dynamique généré"
    
    Given path '/posts'
    And request 
    """
    {
      "title": "#(myTitle)",
      "body": "#(myContent)",
      "userId": "#(myUserId)"
    }
    """
    When method POST
    Then status 201
    And match response.title == myTitle
    # 💡 Explication: #(variable) insère la valeur de la variable

  Scenario: Récupérer des données d'une réponse
    # 📝 OBJECTIF: Utiliser les données reçues dans d'autres requêtes
    # Créer un post et récupérer son ID
    Given path '/posts'
    And request { "title": "Post source", "body": "Contenu", "userId": 1 }
    When method POST
    Then status 201
    * def createdPost = response
    * def retrievedId = response.id
    * print 'ID du post créé:', retrievedId
    
    # Utiliser cet ID pour une autre requête
    Given path '/posts/' + retrievedId
    When method GET
    Then status 200
    And match response.id == retrievedId
    # 💡 Explication: On peut récupérer n'importe quelle valeur de réponse

  Scenario: Fonctions JavaScript simples
    # 📝 OBJECTIF: Créer ses propres fonctions
    * def generateEmail = function(name) { return name.toLowerCase() + '@formation.com' }
    * def generateTitle = function(num) { return 'Post numéro ' + num }
    
    * def testEmail = generateEmail('Alice')
    * def testTitle = generateTitle(42)
    
    * print 'Email généré:', testEmail
    * print 'Titre généré:', testTitle
    
    Given path '/posts'
    And request 
    """
    {
      "title": "#(testTitle)",
      "body": "Email de contact: #(testEmail)",
      "userId": 1
    }
    """
    When method POST
    Then status 201
    # 💡 Explication: Les fonctions JavaScript rendent les tests dynamiques

  Scenario: Manipuler des objets JSON
    # 📝 OBJECTIF: Modifier des structures complexes
    * def user = 
    """
    {
      "name": "Alice",
      "email": "alice@test.com",
      "posts": []
    }
    """
    
    # Modifier l'objet
    * set user.email = 'alice.martin@formation.com'
    * set user.posts[0] = { "title": "Premier post d'Alice" }
    * set user.age = 25
    
    * print 'Utilisateur modifié:', user
    
    # Utiliser l'objet modifié
    Given path '/posts'
    And request 
    """
    {
      "title": "#(user.posts[0].title)",
      "body": "Post créé par #(user.name)",
      "userId": 1
    }
    """
    When method POST
    Then status 201
    # 💡 Explication: 'set' permet de modifier/ajouter des propriétés

  Scenario: Conditions et logique
    # 📝 OBJECTIF: Prendre des décisions dans les tests
    * def userId = 2
    * def isAdmin = userId == 1 ? true : false
    * def titlePrefix = isAdmin ? '[ADMIN]' : '[USER]'
    
    * print 'Est admin?', isAdmin
    * print 'Préfixe:', titlePrefix
    
    * def fullTitle = titlePrefix + ' Post conditionnel'
    
    Given path '/posts'
    And request 
    """
    {
      "title": "#(fullTitle)",
      "body": "Ce post dépend de l'utilisateur",
      "userId": "#(userId)"
    }
    """
    When method POST
    Then status 201
    And match response.title contains titlePrefix
    # 💡 Explication: On peut utiliser la logique conditionnelle

  Scenario: Boucles et répétitions
    # 📝 OBJECTIF: Créer plusieurs éléments automatiquement
    * def numbers = [1, 2, 3]
    * def results = []
    
    # Créer plusieurs posts en boucle
    * eval
    """
    for(var i = 0; i < numbers.length; i++) {
      var number = numbers[i];
      var response = karate.call('classpath:features/formation/jour2/03-variables-avancees.feature@single', {
        title: 'Post automatique ' + number,
        userId: number 
      });
      results.push(response);
    }
    """
    
    * print 'Résultats créés:', results.length
    # 💡 Explication: Les boucles permettent d'automatiser les actions

  Scenario: single
    # 📝 SCENARIO HELPER: Utilisé par la boucle ci-dessus
    Given path '/posts'
    And request 
    """
    {
      "title": "#(title)",
      "body": "Post créé automatiquement",
      "userId": "#(userId)"
    }
    """
    When method POST
    Then status 201

  Scenario: Validation de contrat API avec JSON Schema externe
    # 📝 OBJECTIF: Valider la structure des réponses avec un schéma formel
    * def userSchema = read('classpath:data/user-schema.json')
    * print 'Schéma chargé:', userSchema
    
    # Récupérer un utilisateur
    Given path '/users/1'
    When method GET
    Then status 200
    
    # Validation basique Karate (rapide)
    And match response ==
    """
    {
      "id": '#number',
      "name": '#string',
      "username": '#string',
      "email": '#string',
      "address": '#object',
      "phone": '#string', 
      "website": '#string',
      "company": '#object'
    }
    """
    
    # Validation avec contraintes métier
    And match response.id == '#? _ > 0 && _ <= 10'
    And match response.email == '#regex .*@.*\\..*'
    
    # Note: Pour validation JSON Schema complète, utiliser une lib externe
    * print 'Validation de contrat réussie pour utilisateur:', response.name
    # 💡 Explication: Les contrats API garantissent la stabilité des interfaces