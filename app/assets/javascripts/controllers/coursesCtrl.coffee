angular.module('courses').controller('CoursesCtrl', [
  '$scope'
  '$http'
  ($scope, $http) ->
    $scope.page = 1
    $scope.per_page = 1
    $scope.courses = []
    $scope.showNav = true

    showMessage = (data) ->
      $scope.alerts = []
      lastUpdatedTime = new Date(data[0].updated_at)
      message = 'В данный момент Teachbase недоступен. Загружена копия от ' + lastUpdatedTime.toLocaleString()
      $scope.addAlert(message)  
      
      downtime = Math.round((Date.now() - lastUpdatedTime) / (3600 * 1000))
      if downtime > 1    
        message = 'Teachbase лежит уже ' + downtime  + ' часов'  
        $scope.addAlert(message)

    loadPage = (page, per_page) ->
      $http.get('/courses.json', { "params": { "page": page, "per_page": per_page } }).success((data) ->
        $scope.courses = data
        return
      ).error (data, status, headers, config) ->
          showMessage data
          $scope.showNav = false
          $scope.courses = data
          return

    loadPage 1, $scope.per_page

    $scope.previousPage = ->
      if $scope.page - 1 > 0
        loadPage --$scope.page, $scope.per_page
      return

    $scope.nextPage = ->
      if $scope.courses.length >= $scope.per_page
        loadPage ++$scope.page, $scope.per_page
      return

    $scope.addAlert = (message) ->
      $scope.alerts.push
        msg: message
      return
])
