Feature: PROJET 2 - Modération de contenu
  # 📝 DÉFI: Simuler la modération d'un forum
  # CONSIGNES:
  # 1. Créer un post avec du contenu "problématique"
  # 2. Le modifier pour le censurer
  # 3. Vérifier que le contenu est bien censuré

  Background:
    * url 'http://localhost:3000'

  Scenario: Modération automatique de contenu inapproprié
    * def contenuProblematique = "Ce post contient des mots interdits: spam, pub, arnaque"

    # TODO: Définir le contenu censuré
    # CONSIGNE: Remplacer les mots interdits par des étoiles
    * def contenuCensure = 
    
    # TODO: Créer le post original
    # CONSIGNE: POST /posts avec le contenu problématique
    Given path '/posts'
    # TODO: Compléter la requête avec title et body
    # TODO: Ajouter la méthode POST
    # TODO: Vérifier le status 201
    # TODO: Stocker l'ID du post




    
    
    # TODO: Modérer (censurer) le contenu
    # CONSIGNE: Utiliser PUT avec le contenu censuré
    # AIDE: N'oubliez pas d'inclure l'id dans la requête
    Given path '/posts/' + postId
    # TODO: Compléter la requête avec le nouveau contenu
    # TODO: Ajouter la méthode PUT
    # TODO: Vérifier le status et le contenu censuré