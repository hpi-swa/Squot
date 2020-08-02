running
pull
	"Pull versions from the upstream historian.
	May signal SquitUpstreamUndefined if an upstream branch is configured but the remote is not (inconsistent configuration)."
	localHistorian := self workingCopy loadedHistorian.
	self fetchFromUpstream ifNil: [^ self].
	self merge ifNil: [^ self].
	self workingCopy additionalParents size > 0
		ifTrue:
			[self save ifNil: [^ self]]
		ifFalse:
			[self inform: 'Adopted ', localHistorian upstreamVersion].