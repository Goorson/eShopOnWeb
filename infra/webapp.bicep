param webAppName string
param location string = resourceGroup().location

// Pobieramy domyślny/istniejący App Service Plan w tej grupie zasobów lub szukamy alternatywy
// Jeżeli w grupie zasobów nie ma planu, użyjemy referencji lub uproszczonego wdrożenia.
// Ale najpierw stwórzmy samą WebApp, odwołując się do najtańszego Free planu jako istniejącego:

resource appService 'Microsoft.Web/sites@2022-09-01' = {
  name: webAppName
  kind: 'app'
  location: location
  properties: {
    siteConfig: {
      netFrameworkVersion: 'v8.0'
      appSettings: [
        {
          name: 'ASPNETCORE_ENVIRONMENT'
          value: 'Development'
        }
        {
          name: 'UseOnlyInMemoryDatabase'
          value: 'true'
        }
      ]
    }
  }
}
