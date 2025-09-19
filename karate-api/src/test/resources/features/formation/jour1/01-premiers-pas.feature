Feature: JOUR 1 - MATIN - Premiers pas avec Karate (1h30)
  # 🎯 Objectifs: 
  # - Comprendre la structure de base d'un test Karate
  # - Faire sa première requête GET
  # - Comprendre les codes de statut

  Background:
    # Cette section s'exécute avant chaque scénario
    * url 'https://jsonplaceholder.typicode.com'
    # 💡 Explication: On définit l'URL de base de notre API

  Scenario: Mon tout premier test Karate
    # 📝 OBJECTIF: Vérifier que l'API nous répond
    Given path '/posts/1'
    When method GET
    Then status 200
    # 💡 Explication: 
    # - Given = on prépare la requête (chemin)
    # - When = on exécute (méthode HTTP)
    # - Then = on vérifie le résultat (code de statut)

  Scenario: Voir ce que l'API nous retourne
    # 📝 OBJECTIF: Examiner la réponse complète
    Given path '/posts/1'
    When method GET
    Then status 200
    * print response
    # 💡 Explication: 'print response' nous montre ce qu'on reçoit

  Scenario: Ma première vérification de données
    # 📝 OBJECTIF: Vérifier UN champ spécifique
    Given path '/posts/1'
    When method GET
    Then status 200
    And match response.id == 1
    # 💡 Explication: response.id accède au champ 'id' du JSON reçu

  Scenario: Vérifier plusieurs champs
    # 📝 OBJECTIF: Enchaîner plusieurs vérifications
    Given path '/posts/1'
    When method GET
    Then status 200
    And match response.id == 1
    And match response.userId == 1
    # 💡 Explication: On peut enchaîner avec 'And match'

  Scenario: Tester différents posts
    # 📝 OBJECTIF: Essayer d'autres URLs
    Given path '/posts/2'
    When method GET
    Then status 200
    And match response.id == 2

 
    
  Scenario: Que se passe-t-il si le post n'existe pas ?
    # 📝 OBJECTIF: Comprendre les erreurs
    Given path '/posts/999999'
    When method GET
    Then status 404
    # 💡 Explication: 404 = "Not Found" (ressource inexistante)