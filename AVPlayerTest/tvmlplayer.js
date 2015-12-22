function playStream(){
	currentPlayer = new Player();
	var playlist = new Playlist();
	var mediaItem = new MediaItem();
	mediaItem.url = "https://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/gear1/prog_index.m3u8";
	playlist.push(mediaItem);
	currentPlayer.playlist = playlist;
    currentPlayer.addEventListener("stateDidChange", function(e) {
                                   playerStateChanged(e);
                                   }, false);
	currentPlayer.present();
}

App.onLaunch = function(options) {
    var tvml = "<document><loadingTemplate><activityIndicator><title></title></activityIndicator></loadingTemplate></document>";

    loadingIndicator = new DOMParser().parseFromString(tvml, "application/xml");
    navigationDocument.pushDocument(loadingIndicator);

	playStream();
}

function playerStateChanged(event){
    if(event.state=="end"){
        endPlayback();
    }
}