angular.module("hyper-guides")
  .controller "LoginCtrl", ($http, $scope, $mdDialog, $mdToast) ->
    $scope.submit = =>
      $http.post "/sessions",
        username: $scope.form.username
        password: $scope.form.password
      .success ->
        # TODO :: Set a logged-in state on the client

        $mdToast.show
          template: """
            <md-toast>
              Signed in successfully!
            </md-toast>
          """

        $mdDialog.hide()
      .error (data, status) ->
        if status == 422
          $mdToast.show
            template: """
              <md-toast>
                Wrong username or password.
              </md-toast>
            """
        else
          $mdToast.show
            template: """
              <md-toast>
                Something went wrong.
              </md-toast>
            """

    $scope.cancel = =>
      $mdDialog.cancel()

    this
