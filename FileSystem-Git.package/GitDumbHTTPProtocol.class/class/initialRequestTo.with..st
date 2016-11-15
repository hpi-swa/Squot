connection
initialRequestTo: aUrl with: aClient
	^ aClient httpGet: aUrl asString , '/info/refs?service=git-upload-pack'