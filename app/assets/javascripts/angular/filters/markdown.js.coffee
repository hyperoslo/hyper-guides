angular.module("hyper-guides")
  .filter "markdown", ->
    (input) ->
      return "" unless input
      marked input
