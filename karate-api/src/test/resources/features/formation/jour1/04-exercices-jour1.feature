Feature: JOUR 1 - APRÈS-MIDI - Exercices pratiques et consolidation (2h)
  # 🎯 Objectifs:
  # - Consolider les acquis du matin
  # - Résoudre des problèmes concrets
  # - Gagner en autonomie
  # ⏱️ Durée: 2h (15h30-17h30
  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: EXERCICE 1 - Explorer l'API des albums
    # 📝 DÉFI: Découvrir une nouvelle ressource
    # CONSIGNES:
    # 1. Récupérer tous les albums (/albums)
    # 2. Vérifier qu'on en a exactement 100
    # 3. Vérifier que le premier album a un userId et un id
    
    Given path '/albums'
    When method GET
    Then status 200
    And match response == '#[100]'
    And match response[0].userId == '#number'
    And match response[0].id == '#number'
    And match response[0].title == '#string'

  Scenario: EXERCICE 2 - Trouver les albums d'un utilisateur
    # 📝 DÉFI: Utiliser les paramètres de filtrage
    # CONSIGNES:
    # 1. Récupérer les albums de l'utilisateur 2
    # 2. Vérifier qu'ils appartiennent tous à cet utilisateur
    
    Given path '/albums'
    And param userId = 2
    When method GET
    Then status 200
    And match each response[*].userId == 2

  Scenario: EXERCICE 3 - Explorer les commentaires
    # 📝 DÉFI: Découvrir une nouvelle structure de données
    # CONSIGNES:
    # 1. Récupérer tous les commentaires (/comments)
    # 2. Examiner la structure du premier commentaire
    # 3. Vérifier qu'il a: postId, id, name, email, body
    
    Given path '/comments'
    When method GET
    Then status 200
    And match response == '#array'
    And match response[0] ==
    """
    {
      "postId": '#number',
      "id": '#number',
      "name": '#string',
      "email": '#string',
      "body": '#string'
    }
    """

  Scenario: EXERCICE 4 - Validation d'email avec regex
    # 📝 DÉFI: Utiliser une expression régulière
    # CONSIGNES:
    # 1. Récupérer un commentaire
    # 2. Vérifier que l'email est au bon format
    
    Given path '/comments/1'
    When method GET
    Then status 200
    And match response.email == '#regex .+@.+\\..+'
    # 💡 Explication: '#regex' + pattern pour valider le format

  Scenario: EXERCICE 5 - Créer votre propre test
    # 📝 DÉFI LIBRE: Inventez votre propre scénario
    # SUGGESTIONS:
    # - Tester /todos (tâches à faire)
    # - Tester /photos (photos des albums)
    # - Combiner plusieurs vérifications
    
    # À vous de jouer ! Écrivez votre test ici...
    Given path '/todos/1'
    When method GET
    Then status 200
    And match response.userId == '#number'
    And match response.id == '#number'
    And match response.title == '#string'
    And match response.completed == '#boolean'

  Scenario: EXERCICE 6 - Test de cohérence des données
    # 📝 DÉFI AVANCÉ: Vérifier la logique métier
    # CONSIGNES:
    # 1. Récupérer un post spécifique
    # 2. Récupérer ses commentaires
    # 3. Vérifier que tous les commentaires pointent vers ce post
    
    Given path '/posts/5'
    When method GET
    Then status 200
    * def postId = response.id
    
    Given path '/comments'
    And param postId = postId
    When method GET
    Then status 200
    And match each response[*].postId == postId

  Scenario: BILAN JOUR 1 - Qu'avons-nous appris ?
    # 📝 RÉCAPITULATIF des concepts vus aujourd'hui:
    # ✅ Structure Given/When/Then
    # ✅ Codes de statut (200, 404)
    # ✅ Assertions exactes (==) vs types (#string, #number)
    # ✅ Arrays et accès par index [0], [1]...  
    # ✅ Validation de tous les éléments (match each)
    # ✅ Paramètres d'URL (param)
    # ✅ Expressions régulières (#regex)
    
    # Test de validation finale
    Given path '/posts/1'
    When method GET
    Then status 200
    And match response == 
    """
    {
      "userId": '#number',
      "id": '#number',
      "title": '#string', 
      "body": '#string'
    }
    """
    # 🎉 FÉLICITATIONS ! Vous maîtrisez les bases de Karate !