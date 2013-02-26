instance creation
continueWith: aZnClient from: aUrl
	^ (self connectTo: aUrl)
				continueWith: aZnClient