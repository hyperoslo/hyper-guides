angular.module("hyper-guides")
  .controller "GuideOptionsCtrl",($location, $scope, $mdBottomSheet, $mdToast, guide) ->
    $scope.edit = ->
      $location.path guide.edit_path
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
