Feature: PROJET 3 - Statistiques de blog
  # 📝 DÉFI: Analyser les données d'un blog
  # CONSIGNES:
  # 1. Récupérer tous les posts d'un utilisateur
  # 2. Compter combien il en a
  # 3. Calculer la longueur moyenne des titres

  Background:
    * url 'http://localhost:3000'

  Scenario: Analyse des statistiques d'un blog utilisateur
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