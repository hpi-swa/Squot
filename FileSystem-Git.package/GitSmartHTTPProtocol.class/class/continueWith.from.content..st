instance creation
continueWith: aZnClient from: aUrl content: aString
	^ (self connectTo: aUrl)
				continueWith: aZnClient initialResponseContent: aString