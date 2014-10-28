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
              <md-button ng-click="toastCtrl.close()">Close</md-button>
            </md-toast>
          """
          controller: "ToastCtrl"
          controllerAs: "toastCtrl"
          hideDelay: 0

    this
