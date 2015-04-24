@nifl.controller 'UsersIndexController', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  console.log "Root Controller"
  
  $scope.seasons = []

  $http.get("./home.json").success((data) ->
    $scope.seasons = data
  )


  $scope.viewSeason = (id) ->
    $location.url "/seasons/#{id}"

]

