Feature: PROJET 4 - Workflow complet de publication
  # 📝 DÉFI AVANCÉ: Simuler un workflow complet
  # CONSIGNES:
  # 1. Créer un brouillon (draft)
  # 2. Le réviser (modifier)
  # 3. Le publier (marquer comme publié)
  # 4. Vérifier le statut final

  Background:
    * url 'http://localhost:3000'

  Scenario: Cycle complet de publication d'article
    # Étape 1: Brouillon
    * def brouillon = 
    """
    {
      "title": "[BROUILLON] Mon article en cours",
      "body": "Contenu temporaire, à réviser...",
      "userId": 1
    }
    """
    
    # TODO: Créer le brouillon
    # CONSIGNE: POST /posts avec l'objet brouillon
    Given path '/posts'
    # TODO: Compléter la requête et méthode
    # TODO: Vérifier le status et stocker l'ID
    
    # Étape 2: Révision
    # TODO: Définir l'objet revision avec le nouvel ID
    # CONSIGNE: Changer le titre et body, garder le même userId
    * def revision = 
    """
    {
      // TODO: Ajouter id, title, body et userId
    }
    """
    
    # TODO: Mettre à jour l'article (révision)
    # CONSIGNE: PUT /posts/{id} avec l'objet revision
    Given path '/posts/' + articleId
    # TODO: Compléter la requête PUT
    
    # Étape 3: Publication finale
    # TODO: Définir l'objet publication final
    * def publication = 
    """
    {
      // TODO: Version finale avec nouveau titre et contenu
    }
    """
    
    # TODO: Publier l'article final
    # CONSIGNE: PUT avec vérification du titre final
    Given path '/posts/' + articleId
    # TODO: Compléter la publication et vérifier le titre