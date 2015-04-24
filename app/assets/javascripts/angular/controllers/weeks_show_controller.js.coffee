@nifl.controller 'WeeksShowController', ['$scope', '$location', '$http', '$routeParams', ($scope, $location, $http, $routeParams) ->
  console.log "Weeks Controller"
  
  $scope.week = []
  $scope.games = []
  
  $http.get("./weeks/#{$routeParams.id}.json").success((data) ->
    $scope.week = data.week
    $scope.games = data.games
  )
  
  console.log "Weeks Controller"
  

  $scope.viewWeek = (id) ->
    $location.path "/weeks/#{id}"
]

