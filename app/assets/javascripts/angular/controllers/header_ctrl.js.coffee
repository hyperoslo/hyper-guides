angular.module("hyper-guides")
  .controller "HeaderCtrl", ($mdDialog) ->
    @openLoginModal = ->
      $mdDialog.show
        templateUrl: "login-modal"
        hasBackdrop: false
        controller: "LoginCtrl"

    this
