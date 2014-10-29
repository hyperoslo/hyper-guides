angular.module("hyper-guides")
  .config ($locationProvider, $routeProvider) ->
    $locationProvider.html5Mode
      enabled: true
      requireBase: false

    $routeProvider
      .when "/",
        templateUrl: "/?format=html"

      .when "/guides/new",
        templateUrl: "/guides/new.html"

      .when "/guides/:id",
        templateUrl: (params) ->
          "/guides/#{params.id}.html"
