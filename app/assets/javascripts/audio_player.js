$(document).ready(function()
            {
        var myCirclePlayer = new CirclePlayer("#jquery_jplayer_1",
        {
            mp3: "MyMP3File.mp3"
        }, {
                supplied: "mp3",
                cssSelectorAncestor: "#cp_container_1",
                swfPath: "js",
                wmode: "window"
        });
    });
