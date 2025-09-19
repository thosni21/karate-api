
function fn() {
  var env = karate.env; // Récupère l'environnement depuis -Dkarate.env=xxx
  karate.log('karate.env system property was:', env);
  
  if (!env) {
    env = 'dev'; // Environnement par défaut
  }
  
  var config = {
    env: env,
    baseUrl: 'https://api.example.com', // URL de base accessible partout
    timeout: 10000 // Timeout global en millisecondes
  }
  
  // Configuration spécifique par environnement
  if (env == 'dev') {
    config.baseUrl = 'https://dev-api.example.com';
  } else if (env == 'staging') {
    config.baseUrl = 'https://staging-api.example.com';
  }
  
  return config; // Toutes ces propriétés deviennent globales
}
        
