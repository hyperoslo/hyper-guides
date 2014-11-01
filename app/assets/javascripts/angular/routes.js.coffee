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
        controller: "NewGuideCtrl"
        controllerAs: "newGuideCtrl"

      .when "/guides/:id",
        templateUrl: (params) ->
          "/guides/#{params.id}.html"
        controller: "GuideCtrl"
        controllerAs: "guideCtrl"
