//Articles service used for articles REST endpoint
angular.module('mean.highlights').factory("Highlights", ['$resource', function($resource) {
    return $resource('highlights/:highlightId', {
        articleId: '@_id'
    }, {
        update: {
            method: 'PUT'
        }
    });
}]);