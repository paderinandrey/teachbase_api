courses = angular.module('courses', ['ui.router', 'templates', 'ui.bootstrap'])

courses.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider
    .state 'courses',
      url: '/courses'
      templateUrl: 'courses/index.html'
      controller: 'CoursesCtrl'

    $urlRouterProvider.otherwise ($injector, $location) ->
      $state = $injector.get('$state')
      $state.go 'courses'
      return
  ]
