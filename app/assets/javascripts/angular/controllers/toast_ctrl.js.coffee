angular.module("hyper-guides")
  .controller "ToastCtrl", ($mdToast) ->
    @close = ->
      $mdToast.hide()

    this
