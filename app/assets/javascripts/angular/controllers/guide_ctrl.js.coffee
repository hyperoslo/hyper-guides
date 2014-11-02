angular.module("hyper-guides")
  .controller "GuideCtrl", ($route, $mdBottomSheet, Guide) ->
    @guide = Guide.get id: $route.current.pathParams.id

    @openBottomSheet = =>
      $mdBottomSheet.show
        template: """
          <md-bottom-sheet class="md-list">
            <md-list>
              <md-item ng-click="edit()">Edit guide</md-item>
            </md-list>
          </md-bottom-sheet>
        """
        controller: ($location, $scope, $mdBottomSheet, guide) ->
          $scope.edit = ->
            $location.path "/guides/#{guide.slug}/edit"
            $mdBottomSheet.hide()

        locals:
          guide: @guide

    this
