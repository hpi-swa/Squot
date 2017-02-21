private
initialRequestTo: aUrl withService: aServiceName
	^ self client httpGet: aUrl asString , '/info/refs?service=', aServiceName