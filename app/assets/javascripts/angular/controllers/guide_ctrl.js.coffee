angular.module("hyper-guides")
  .controller "GuideCtrl", ($route, $mdBottomSheet, Guide) ->
    @guide = Guide.get id: $route.current.pathParams.id

    @openBottomSheet = =>
      $mdBottomSheet.show
        template: """
          <md-bottom-sheet class="md-list">
            <md-list>
              <md-item ng-click="edit()">Edit guide</md-item>
              <md-item ng-click="delete()">Delete guide</md-item>
            </md-list>
          </md-bottom-sheet>
        """
        controller: ["$location", "$scope", "$mdBottomSheet", "$mdToast", "guide", ($location, $scope, $mdBottomSheet, $mdToast, guide) ->
          $scope.edit = ->
            $location.path "/guides/#{guide.slug}/edit"
            $mdBottomSheet.hide()
          $scope.delete = ->
            guide.$delete().then ->
              $mdToast.show
                template: """
                  <md-toast>
                    <span flex>Guide was deleted successfully</span>
                  </md-toast>
                """
              $location.path "/"
              $mdBottomSheet.hide()
        ]

        locals:
          guide: @guide

    this
