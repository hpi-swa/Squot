initialize-release
continueWith: aZnClient initialResponseContent: aString
	client := aZnClient.
	refs := self fetchRefsFrom: aString readStream