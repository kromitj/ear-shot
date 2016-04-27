$(document).ready(function() {

var music = document.getElementById('music'); // id for audio element
var duration; // Duration of audio clip
// var volume; // current volume
var pButton = document.getElementById('pButton'); // play button

var playhead = document.getElementById('playhead'); // playhead
// var volumehead = document.getElementById('volumehead'); //volumehead
var timeline = document.getElementById('timeline'); // timeline
// timeline width adjusted for playhead
// var volumeline = document.getElementById('volumeline'); //volumeline
var timelineWidth = timeline.offsetWidth - playhead.offsetWidth;
// var volumeWidth = volumeline.offsetWidth - volumehead.offsetWidth;
// timeupdate event listener
music.addEventListener("timeupdate", timeUpdate, false);
music.addEventListener("volumeupdate", volumeUpdate, false);

//Makes timeline clickable
timeline.addEventListener("click", function (event) {
  moveplayhead(event);
  music.currentTime = duration * clickPercent(event);
}, false);

// volumeline.addEventListener("click", function(event){
  // movevolumehead(event);
  // music.currentVolume = music.volume * volumeClickPercent(event);
// }, false);
// returns click as decimal (.77) of the total timelineWidth
function clickPercent(e) {
  return (e.pageX - timeline.offsetLeft) / timelineWidth;
}

// function volumeClickPercent(e) {
//   return (e.pageX - volumeline.offsetLeft) / volumeWidth;
// }

// Makes playhead draggable
playhead.addEventListener('mousedown', mouseDown, false);
// volumehead.addEventListener('mousedown', volumeMouseDown, false);


window.addEventListener('mouseup', mouseUp, false);
// volumehead.addEventListener('mouseup', volumeMouseUp, false);

// Boolean value so that mouse is moved on mouseUp only when the playhead is released
var onplayhead = false;
var onvolumehead = false;
// mouseDown EventListener
function mouseDown() {
  onplayhead = true;
  window.addEventListener('mousemove', moveplayhead, true);
  music.removeEventListener('timeupdate', timeUpdate, false);
}

// function volumeMouseDown() {
//   onvolumehead = true;
//   window.addEventListener('mousemove', movevolumehead, true);
//   // music.removeEventListener('volumeUpdate', volumeUpdate, false);
// }
// mouseUp EventListener
// getting input from all mouse clicks
function mouseUp(e) {
  if (onplayhead === true) {
    moveplayhead(e);
    window.removeEventListener('mousemove', moveplayhead, true);
    // change current time
    music.currentTime = duration * clickPercent(e);
    music.addEventListener('timeupdate', timeUpdate, false);
  }
  onplayhead = false;
}
// function volumeMouseUp(e) {
//   if (onvolumehead === true) {
//     movevolumehead(e);
//     window.removeEventListener('mousemove', movevolumehead, true);
//     // change current time
//     music.currentVolume = music.volume * volumeClickPercent(e);
//     music.addEventListener('timeupdate', volumeUpdate, false);
//   }
//   onvolumehead = false;
// }// mousemove EventListener
// Moves playhead as user drags
function moveplayhead(e) {
  var newMargLeft = e.pageX - timeline.offsetLeft;
  if (newMargLeft >= 0 && newMargLeft <= timelineWidth) {
    playhead.style.marginLeft = newMargLeft + "px";
  }
  if (newMargLeft < 0) {
    playhead.style.marginLeft = "0px";
  }
  if (newMargLeft > timelineWidth) {
    playhead.style.marginLeft = timelineWidth + "px";
  }
}

// function movevolumehead(e) {
//   var newMargLeft = e.pageX - volumeline.offsetLeft;
//   if (newMargLeft >= 0 && newMargLeft <= volumeWidth) {
//     volumehead.style.marginLeft = newMargLeft + "px";
//   }
//   if (newMargLeft < 0) {
//     volumehead.style.marginLeft = "0px";
//   }
//   if (newMargLeft > volumeWidth) {
//     volumehead.style.marginLeft = volumeWidth + "px";
//   }
// }

// timeUpdate
// Synchronizes playhead position with current point in audio
function timeUpdate() {
  var playPercent = timelineWidth * (music.currentTime / duration);
  playhead.style.marginLeft = playPercent + "px";
  if (music.currentTime == duration) {
    pButton.className = "";
    pButton.className = "play";
  }
}

// function volumeUpdate(){
//   var volumePercent = volumeWidth * music.volume;
//   volumehead.style.marginLeft = volumePercent + "px";
//   music.volume = 1*volume
//   if(music.volume === 0){
//     volumehead.className="";
//     volumehead.className="mute";
//   }
// };

$("#pButton").on("click", function(){

  // start music
  if (music.paused) {
    music.play();
    // remove play, add pause
    pButton.className = "";
    pButton.className = "pause";
  } else { // pause music
    music.pause();
    // remove pause, add play
    pButton.className = "";
    pButton.className = "play";
  }
});


// $("#mutebutton").on("click", function(event){
//   music.currentVolume = music.volume * volumeClickPercent(event);
//   if(music.currentVolume > 0){
//     music.volume = 0;
//     this.className = "";
//     this.className = "mute"
// }
// });


// Gets audio file duration
music.addEventListener("canplaythrough", function () {
  duration = music.duration;
}, false);

// music.addEventListener("canchangevolume", function(){
//   volume = music.volume;
// }, false);
// });
