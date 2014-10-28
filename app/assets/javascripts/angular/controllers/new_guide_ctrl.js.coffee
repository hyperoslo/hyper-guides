angular.module("hyper-guides")
  .controller "NewGuideCtrl", (Guide) ->
    @guide = new Guide()

    this
