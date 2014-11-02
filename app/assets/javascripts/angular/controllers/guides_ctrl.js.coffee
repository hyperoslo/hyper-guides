angular.module("hyper-guides")
  .controller "GuidesCtrl", (Guide) ->
    @guides = Guide.query()

    this
