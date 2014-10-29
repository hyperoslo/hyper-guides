angular.module("hyper-guides")
  .factory "Guide", ($resource) ->
    $resource("/guides/:id.json", id: '@id')
