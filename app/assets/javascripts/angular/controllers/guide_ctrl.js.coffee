angular.module("hyper-guides")
  .controller "GuideCtrl", ($route, Guide) ->
    @guide = Guide.get id: $route.current.pathParams.id

    this
