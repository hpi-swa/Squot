actions
isUpstreamRemoteSupported: aHistorian
	| remoteUrl |
	remoteUrl := self remoteUrlOf: aHistorian.
	^ remoteUrl notNil and: [remoteUrl beginsWith: 'http']