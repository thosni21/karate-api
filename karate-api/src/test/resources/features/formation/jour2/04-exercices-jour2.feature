Feature: JOUR 2 - APRÈS-MIDI - Exercices pratiques et projets (2h30)
  # 🎯 Objectifs:
  # - Consolider CRUD et variables
  # - Résoudre des problèmes complexes
  # - Créer des workflows réalistes

  Background:
    * url 'http://localhost:3000'

  Scenario: PROJET 1 - Gestion d'un blog personnel
    # 📝 DÉFI: Simuler la création d'un blog
    # CONSIGNES:
    # 1. Créer un profil utilisateur (pas d'API, juste variable)
    # 2. Créer 3 articles de blog
    # 3. Vérifier que tous les articles sont bien créés
    
    * def blogOwner = 
    """
    {
      "name": "Alice Martin",
      "username": "alice_blog",
      "email": "alice@monblog.com",
      "address": {
        "street": "Blog Street",
        "suite": "Suite 1",
        "city": "WebCity",
        "zipcode": "12345",
        "geo": {
          "lat": "0.0",
          "lng": "0.0"
        }
      },
      "phone": "123-456-7890",
      "website": "alice-blog.com",
      "company": {
        "name": "Personal Blog",
        "catchPhrase": "Sharing my thoughts",
        "bs": "personal blogging"
      }
    }
    """
    
    * def articlesCreated = []

    # TODO: Créer un nouveau utilisateur
    # CONSIGNE: Utiliser POST /users avec blogOwner
    # AIDE: N'oubliez pas de stocker la réponse dans createdUser
    Given path '/users'
    # TODO: Compléter la requête
    # TODO: Compléter la méthode
    # TODO: Vérifier le status
    # TODO: Stocker la réponse
    
    # TODO: Définir les articles avec l'ID du nouvel utilisateur
    # CONSIGNE: Créer un array de 3 articles avec userId dynamique
    * def articles = 
    """
    [
      // TODO: Article 1 - "Mon premier article de blog"
      // TODO: Article 2 - "Les tests d'API c'est génial"  
      // TODO: Article 3 - "Projet final du jour 2"
    ]
    """
    
    # TODO: Créer chaque article (3 fois POST /posts)
    # CONSIGNE: Utiliser articles[0], articles[1], articles[2]
    # AIDE: Stocker chaque réponse dans articlesCreated
    
    # TODO: Afficher le récapitulatif
    # CONSIGNE: Print le nom du blogOwner et le nombre d'articles

  Scenario: PROJET 2 - Modération de contenu
    # 📝 DÉFI: Simuler la modération d'un forum
    # CONSIGNES:
    # 1. Créer un post avec du contenu "problématique"
    # 2. Le modifier pour le censurer
    # 3. Vérifier que le contenu est bien censuré
    
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

  Scenario: PROJET 3 - Statistiques de blog
    # 📝 DÉFI: Analyser les données d'un blog
    # CONSIGNES:
    # 1. Récupérer tous les posts d'un utilisateur
    # 2. Compter combien il en a
    # 3. Calculer la longueur moyenne des titres
    
    * def userId = 1
    
    # TODO: Récupérer tous les posts de l'utilisateur
    # CONSIGNE: GET /posts avec param userId
    Given path '/posts'
    # TODO: Ajouter le paramètre userId
    # TODO: Exécuter la requête GET
    # TODO: Vérifier le status 200
    # TODO: Stocker la réponse dans userPosts
    
    # TODO: Calculer le nombre de posts
    # AIDE: Utiliser .length sur userPosts
    * def nombrePosts = 
    
    # TODO: Calculer la longueur totale des titres
    # CONSIGNE: Utiliser une boucle for pour additionner
    * def totalLongueurTitres = 0
    # TODO: Écrire la boucle for pour parcourir userPosts
    # TODO: Dans chaque itération, ajouter userPosts[i].title.length à totalLongueurTitres
    
    # TODO: Calculer la moyenne (arrondie)
    # AIDE: Math.round(total / nombre)
    * def longueurMoyenne = 
    
    # TODO: Afficher les statistiques
    # CONSIGNE: Print userId, nombrePosts et longueurMoyenne
    
    # TODO: Vérifier que les résultats sont positifs
    # AIDE: match avec '#? _ > 0'

  Scenario: PROJET 4 - Workflow complet de publication
    # 📝 DÉFI AVANCÉ: Simuler un workflow complet
    # CONSIGNES:
    # 1. Créer un brouillon (draft)
    # 2. Le réviser (modifier)
    # 3. Le publier (marquer comme publié)
    # 4. Vérifier le statut final
    
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

  