Feature: JOUR 1 - APRÈS-MIDI - Listes et tableaux JSON (2h)
  # 🎯 Objectifs:
  # - Comprendre les arrays/listes en JSON
  # - Accéder aux éléments par index
  # - Valider des collections de données

  Background:
    * url baseUrl

  Scenario: Ma première liste - Tous les posts
    # 📝 OBJECTIF: Découvrir qu'on peut recevoir plusieurs éléments
    Given path '/posts'
    When method GET
    Then status 200
    And match response == '#array'
    # 💡 Explication: '#array' vérifie qu'on a bien un tableau/liste
    * print 'Nombre d\'éléments:', response.length

  Scenario: Compter les éléments
    # 📝 OBJECTIF: Vérifier combien d'éléments on a
    Given path '/posts'
    When method GET
    Then status 200
    And match response == '#[100]'
    # 💡 Explication: '#[100]' = exactement 100 éléments dans le tableau

  Scenario: Accéder au premier élément
    # 📝 OBJECTIF: Comprendre les index (position dans la liste)
    Given path '/posts'
    When method GET
    Then status 200
    And match response[0].id == 1
    And match response[1].id == 2
    And match response[2].id == 3
    # 💡 Explication: Les index commencent à 0 (premier = 0, deuxième = 1...)

  Scenario: Examiner différents éléments
    # 📝 OBJECTIF: Naviguer dans la liste
    Given path '/posts'
    When method GET
    Then status 200
    And match response[0].userId == 1
    And match response[9].userId == 1
    And match response[10].userId == 2
    # 💡 Explication: On peut accéder à n'importe quel élément par son index

  Scenario: Vérifier que TOUS les éléments ont la même structure
    # 📝 OBJECTIF: Valider uniformité des données
    Given path '/posts'
    When method GET
    Then status 200
    And match each response == 
    """
    {
      "userId": '#number',
      "id": '#number', 
      "title": '#string',
      "body": '#string'
    }
    """
    # 💡 Explication: 'match each' applique la vérification à TOUS les éléments

  Scenario: Travailler avec une liste plus petite
    # 📝 OBJECTIF: Tester avec les utilisateurs (seulement 10)
    Given path '/users'
    When method GET
    Then status 200
    And match response == '#[10]'
    And match response[0].id == 1
    And match response[0].name == '#string'
    # 💡 Explication: Chaque API peut retourner des quantités différentes

  Scenario: Filtrer une liste avec des paramètres
    # 📝 OBJECTIF: Récupérer seulement certains éléments
    Given path '/posts'
    And param userId = 1
    When method GET
    Then status 200
    And match response == '#[10]'
    And match each response[*].userId == 1
  # 💡 Explication: 'param' ajoute ?userId=1 à l'URL