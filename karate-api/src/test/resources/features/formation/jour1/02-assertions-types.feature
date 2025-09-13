Feature: JOUR 1 - MATIN - Types de données et assertions (1h30)
  # 🎯 Objectifs:
  # - Maîtriser les assertions de types (#string, #number)
  # - Comprendre la différence entre valeur exacte et type
  # - Valider des structures JSON simples

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: Découvrir les types de données
    # 📝 OBJECTIF: Comprendre #string, #number, etc.
    Given path '/posts/1'
    When method GET
    Then status 200
    # Au lieu de vérifier la valeur exacte...
    And match response.id == '#number'
    And match response.title == '#string'
    # 💡 Explication: '#number' = n'importe quel nombre valide

  Scenario: Pourquoi utiliser les types ?
    # 📝 OBJECTIF: Comprendre l'avantage des types vs valeurs exactes
    Given path '/posts/3'
    When method GET
    Then status 200
    And match response.id == 3
    And match response.title == '#string'
    # 💡 Explication: Le titre peut changer, mais sera toujours un texte

  Scenario: Vérifier qu'un champ existe
    # 📝 OBJECTIF: S'assurer de la présence d'un champ
    Given path '/posts/1'
    When method GET
    Then status 200
    And match response.id == '#present'
    And match response.title == '#present'
    # 💡 Explication: '#present' = le champ existe (peu importe sa valeur)

  Scenario: Vérifier qu'un champ n'est pas vide
    # 📝 OBJECTIF: Éviter les valeurs nulles
    Given path '/posts/1'
    When method GET
    Then status 200
    And match response.title == '#notnull'
    And match response.body == '#notnull'
    # 💡 Explication: '#notnull' = le champ a une valeur (pas null/vide)

  Scenario: Combiner différents types d'assertions
    # 📝 OBJECTIF: Mélanger selon nos besoins
    Given path '/posts/1'
    When method GET
    Then status 200
    And match response.id == 1
    And match response.userId == '#number'
    And match response.title == '#string'
    # 💡 Explication: On choisit selon ce qu'on veut contrôler

  Scenario: Valider une structure JSON complète
    # 📝 OBJECTIF: Vérifier tout l'objet d'un coup
    Given path '/posts/1'
    When method GET
    Then status 200
    And match response == 
    """
    {
      "userId": '#number',
      "id": 1,
      "title": '#string',
      "body": '#string'
    }
    """
    # 💡 Explication: On peut valider toute la structure JSON