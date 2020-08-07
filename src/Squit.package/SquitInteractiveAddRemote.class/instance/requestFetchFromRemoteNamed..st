fetching
requestFetchFromRemoteNamed: aString
	^ self confirm: 'Do you want to fetch from remote ', aString, ' now?'