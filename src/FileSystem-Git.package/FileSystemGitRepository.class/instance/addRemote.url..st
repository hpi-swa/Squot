remotes
addRemote: name url: anUrl
	^ self unitOfWork addRemote:
		((GitRemote name: name url: anUrl)
			addDefaultFetchSpec;
			yourself)