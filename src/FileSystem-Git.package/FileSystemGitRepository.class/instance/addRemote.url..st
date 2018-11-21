remotes
addRemote: name url: anUrl
	^ repository addRemote:
		((GitRemote name: name url: anUrl)
			addDefaultFetchSpec;
			yourself)