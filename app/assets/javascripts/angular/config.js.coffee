angular.module("hyper-guides", ["ngMaterial", "ngResource", "ngRoute", "ngSanitize"])
  .config ($mdThemingProvider) ->
    $mdThemingProvider.theme "default"
      .primaryPalette "deep-orange"
      .accentPalette "indigo"

  .config ($httpProvider) ->
    authToken = $("meta[name=\"csrf-token\"]").attr("content")
    $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
    $httpProvider.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest"
    $httpProvider.defaults.headers.common["Accept"] = "text/html,application/json"
