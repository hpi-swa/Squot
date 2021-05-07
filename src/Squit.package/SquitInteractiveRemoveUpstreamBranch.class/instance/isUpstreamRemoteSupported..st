private
isUpstreamRemoteSupported: aHistorian
	| remoteUrl |
	remoteUrl := aHistorian upstreamRemote url.
	^ self isRemoteSupported: remoteUrl