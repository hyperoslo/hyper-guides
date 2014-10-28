angular.module("hyper-guides")
  .controller "GuideCtrl", (Guide) ->
    @guide = Guide.get id: 2

    this
