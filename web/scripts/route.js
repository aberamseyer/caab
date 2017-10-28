/**
 * Created by Commander Data on 10/27/2017.
 */
var routeApp = angular.module('routingApp', []); // might need ngRoute in []
routeApp.config(function($routeProvider) {
    $routeProvider
    .when('/pages/properties.html', {
        templateUrl: 'pages/properties.html',
        controller: 'propertiesController'
    });

    routeApp.controller('propertiesController', function($scope) {
        $scope.propertiesMessage = 'Successful call to properties controller!';
    });
}