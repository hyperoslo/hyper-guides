angular.module("hyper-guides")
  .controller "EditGuideCtrl", ($location, $route, $mdToast, Guide) ->
    @guide = Guide.get id: $route.current.pathParams.id

    @reset = =>
      @guide = Guide.get id: $route.current.pathParams.id

    @submit = =>
      @guide.$update (guide) ->
        $location.path guide.show_path

        $mdToast.show
          template: """
            <md-toast>
              <span flex>Guide was updated successfully</span>
            </md-toast>
          """

    this
