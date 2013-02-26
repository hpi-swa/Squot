instance creation
continueWith: aZnClient from: aUrl
	^ (super connectTo: aUrl)
				continueWith: aZnClient