angular.module("hyper-guides")
  .config ($locationProvider, $routeProvider) ->
    $locationProvider.html5Mode
      enabled: true
      requireBase: false

    $routeProvider
      .when "/",
        templateUrl: "/?format=html"
        controller: "GuidesCtrl"
        controllerAs: "guidesCtrl"

      .when "/guides",
        templateUrl: "/guides.html"
        controller: "GuidesCtrl"
        controllerAs: "guidesCtrl"

      .when "/guides/new",
        templateUrl: "/guides/new.html"
        controller: "NewGuideCtrl"
        controllerAs: "newGuideCtrl"

      .when "/guides/:id",
        templateUrl: (params) ->
          "/guides/#{params.id}.html"
        controller: "GuideCtrl"
        controllerAs: "guideCtrl"

      .when "/guides/:id/edit",
        templateUrl: (params) ->
          "/guides/#{params.id}/edit.html"
        controller: "EditGuideCtrl"
        controllerAs: "editGuideCtrl"
