Feature: PROJET 1 - Gestion d'un blog personnel
  # 📝 DÉFI: Simuler la création d'un blog
  # CONSIGNES:
  # 1. Créer un profil utilisateur 
  # 2. Créer 3 articles de blog
  # 3. Vérifier que tous les articles sont bien créés

  Background:
    * url 'http://localhost:3000'

  Scenario: Création d'un blog personnel complet
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
      {
        "title": "Mon premier article de blog",
        "body": "Aujourd'hui je commence mon blog avec Karate !",
        "userId": 
      },
      {
        "title": "Les tests d'API c'est génial",
        "body": "J'apprends Karate et c'est fantastique",
        "userId":
      },
      {
        "title": "Projet final du jour 2",
        "body": "Voici mon dernier article de la journée",
        "userId":
      }
    ]
    """

    
    # TODO: Créer chaque article (3 fois POST /posts)
    # CONSIGNE: Utiliser articles[0], articles[1], articles[2]
    # AIDE: Stocker chaque réponse dans articlesCreated

    
    
    # TODO: Afficher le récapitulatif
    # CONSIGNE: Print le nom du blogOwner et le nombre d'articles