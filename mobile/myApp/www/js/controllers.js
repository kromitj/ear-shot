angular.module('starter.controllers', [])

.controller('DashCtrl', function ($scope, Songs, $cordovaGeolocation){
  // tracks =  function(Song
  var tracks = Songs.list("postOptions").then(function(data) {
        $scope.songs =  data;
    });
  // var posOptions = {timeout: 10000, enableHighAccuracy: false};
  //   $cordovaGeolocation
  //     .getCurrentPosition(posOptions)
  //     // console.log($cordovaGeolocation.getCurrentPosition());
  //     // console.log(.getCurrentPosition(posOptions))
  //     .then(function(position) {
  //     // lat = position.coords.latitude
  //     // long = position.coords.longitude
  //     });
})

.controller('SongDetailCtrl', function($scope, $stateParams, track) {
  $scope.song = track;
  console.log(track);
})

.controller("CommentDetailCtrl", function($scope, $stateParams, Comment){
  // console.log($stateParams.songId)
  $scope.formData = {};
  $scope.submit = function(){
    // console.log("hello")
    Comment.addComment(this.formData, $stateParams.songId ,window.localStorage.userId);
    // console.log(hello)
  };

})

// .controller('CommentDetailCtrl', function($scope, Comment, track ){
//   $scope.song = track;
//   $scope.submit = function(){
//     // console.log();
//     // Comment.addComment(this.formData)
//   };
// })
.controller('LoginCtrl', function($scope, UserSession) {
  $scope.formData = {};
  $scope.submit = function() {
      UserSession.userInfo(this.formData);
      // console.log(this.formData);
  };
})


.controller('ChatsCtrl', function($scope, Chats) {
  $scope.chats = Chats.all();
  $scope.remove = function(chat) {
    Chats.remove(chat);
  };
})

.controller('ChatDetailCtrl', function($scope, $stateParams, Chats) {
  $scope.chat = Chats.get($stateParams.chatId);
})

.controller('AccountCtrl', function($scope) {
  $scope.settings = {
    enableFriends: true
  };
  console.log(localStorage)
  $scope.user = localStorage
});
