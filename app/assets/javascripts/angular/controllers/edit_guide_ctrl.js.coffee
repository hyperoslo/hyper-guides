angular.module("hyper-guides")
  .controller "EditGuideCtrl", ($route, $mdToast, Guide) ->
    @guide = Guide.get id: $route.current.pathParams.id

    @reset = =>
      @guide = Guide.get id: $route.current.pathParams.id

    @submit = =>
      @guide.$update (guide) ->
        $mdToast.show
          position: "top right"
          template: """
            <md-toast md-theme="indigo">
              <span flex>Guide was updated successfully</span>

              <md-button ng-click="toastCtrl.show()" aria-label="Show">
                Show
              </md-button>

              <md-button ng-click="toastCtrl.close()" aria-label="Close">
                Close
              </md-button>
            </md-toast>
          """
          controller: ($location, $mdToast, guideId) ->
            @close = ->
              $mdToast.hide()

            @show = ->
              $location.path "/guides/#{guideId}"
              @close()

            this
          controllerAs: "toastCtrl"
          hideDelay: 0
          locals:
            guideId: guide.slug

    this
