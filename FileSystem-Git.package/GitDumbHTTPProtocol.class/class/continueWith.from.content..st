instance creation
continueWith: aZnClient from: aUrl content: aString
	^ (super connectTo: aUrl)
				continueWith: aZnClient initialResponseContent: aString