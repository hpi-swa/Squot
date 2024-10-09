requests
getShaOfVersion: aString
	^ (WebClient httpGet: (self githubApiUrlForVersion: aString)) content parseAsJson at: 'sha'