private
checkTrackedBranchOrOfferChange: aHistorian ifUnsupported: unsupportedBlock
	| remoteUrl |
	remoteUrl := self remoteUrlOf: aHistorian.
	remoteUrl ifNil: [^ self].
	(self isUpstreamRemoteSupported: aHistorian) ifFalse:
		[self offerToChangeUpstreamBranchFromUnsupportedRemoteOf: aHistorian name
			in: aHistorian repository gitRepository
			ifCanceled: [^ unsupportedBlock value]].