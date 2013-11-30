angular.module('mean.highlights').controller('HighlightsController', ['$scope', '$routeParams', '$location', 'Global', 'Highlights', function ($scope, $routeParams, $location, Global, Highlights) {
    $scope.global = Global;

    $scope.find = function() {
        console.log("in find")
        Highlights.query(function(highlights) {
            $scope.highlights = highlights;
        });

    };

}]);