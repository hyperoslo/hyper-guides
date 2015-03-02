angular.module("hyper-guides")
  .controller "NewGuideCtrl", ($location, $mdToast, Guide) ->
    @guide = new Guide()

    @reset = =>
      @guide = new Guide()

    @submit = =>
      @guide.$save (guide) ->
        $location.path guide.show_path

        $mdToast.show
          template: """
            <md-toast>
              <span flex>Guide was saved successfully</span>
            </md-toast>
          """

    this
