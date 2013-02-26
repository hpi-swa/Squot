initialize-release
continueWith: aZnClient
	client := aZnClient.
	refs := self fetchRefsFrom: client contents