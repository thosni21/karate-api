Feature: JOUR 2 - MATIN - PUT, PATCH et DELETE (1h30)
  # 🎯 Objectifs:
  # - Comprendre PUT (remplacement total)
  # - Comprendre PATCH (modification partielle)  
  # - Comprendre DELETE (suppression)
  # - Maîtriser le cycle CRUD complet

  Background:
    * url 'http://localhost:3001'

  Scenario: PUT - Remplacer complètement un post
    # 📝 OBJECTIF: Comprendre PUT = remplacement TOTAL
    Given path '/posts/1'
    And request 
    """
    {
      "id": 1,
      "title": "Post complètement remplacé avec PUT",
      "body": "Tout l'ancien contenu a été effacé et remplacé",
      "userId": 1
    }
    """
    When method PUT
    Then status 200
    And match response.title == "Post complètement remplacé avec PUT"
    And match response.id == 1
    # 💡 Explication: PUT remplace TOUT (il faut renvoyer tous les champs)

  Scenario: PATCH - Modifier seulement certains champs  
    # 📝 OBJECTIF: Comprendre PATCH = modification PARTIELLE
    Given path '/posts/1'
    And request 
    """
    {
      "title": "Seul le titre a changé avec PATCH"
    }
    """
    When method PATCH
    Then status 200
    And match response.title == "Seul le titre a changé avec PATCH"
    And match response.id == 1
    # 💡 Explication: PATCH ne change que les champs qu'on envoie

  Scenario: Comprendre la différence PUT vs PATCH
    # 📝 COMPARAISON PRATIQUE:
    
    # AVEC PUT (tout remplacer)
    Given path '/posts/2'
    And request 
    """
    {
      "id": 2,
      "title": "PUT: Nouveau titre",
      "body": "PUT: Nouveau contenu", 
      "userId": 1
    }
    """
    When method PUT
    Then status 200
    * print 'PUT résultat:', response
    
    # AVEC PATCH (modification partielle)
    Given path '/posts/3' 
    And request 
    """
    {
      "title": "PATCH: Seul le titre change"
    }
    """
    When method PATCH
    Then status 200
    * print 'PATCH résultat:', response
    # 💡 Explication: Regardez la différence dans les logs !

  Scenario: DELETE - Supprimer un post
    # 📝 OBJECTIF: Comprendre la suppression
    Given path '/posts/1'
    When method DELETE
    Then status 200
    # 💡 Explication: DELETE supprime la ressource à l'URL donnée

  Scenario: Vérifier qu'un élément a été supprimé
    # 📝 OBJECTIF: Contrôler après suppression
    # Note: JSONPlaceholder simule, donc le post existera encore
    Given path '/posts/5'
    When method DELETE
    Then status 200
    
    # Vérifier (sur une vraie API, ceci devrait donner 404)
    Given path '/posts/5'
    When method GET
    Then status 404

  Scenario: CRUD complet - Create, Read, Update, Delete
    # 📝 OBJECTIF: Enchaîner toutes les opérations
    
    # CREATE (POST)
    Given path '/posts'
    And request { "title": "Post CRUD", "body": "Pour demo complète", "userId": 1 }
    When method POST
    Then status 201
    * def postId = response.id
    * print 'POST créé avec ID:', postId
    
    # READ (GET)
    Given path '/posts/' + postId
    When method GET
    Then status 200
    And match response.title == "Post CRUD"
    * print 'GET récupéré:', response.title
    
    # UPDATE (PUT)  
    Given path '/posts/' + postId
    And request { "id": "#(postId)", "title": "Post CRUD modifié", "body": "Contenu mis à jour", "userId": 1 }
    When method PUT
    Then status 200
    And match response.title == "Post CRUD modifié"
    * print 'PUT mis à jour:', response.title
    
    # DELETE
    Given path '/posts/' + postId
    When method DELETE
    Then status 404
    * print 'DELETE effectué pour ID:', postId
    
