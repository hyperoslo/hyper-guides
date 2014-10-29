angular.module("hyper-guides")
  .controller "NewGuideCtrl", ($mdToast, Guide) ->
    @guide = new Guide()

    @submit = =>
      @guide.$save (guide) ->
        $mdToast.show
          position: "top right"
          template: """
            <md-toast md-theme="indigo">
              <span flex>Guide was saved successfully</span>

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
