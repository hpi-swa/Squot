actions
isUpstreamRemoteSupported: aHistorian
	| remoteUrl |
	remoteUrl := self remoteUrlOf: aHistorian.
	^ self isRemoteSupported: remoteUrl