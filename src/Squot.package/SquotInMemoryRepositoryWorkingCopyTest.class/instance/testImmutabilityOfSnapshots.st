tests
testImmutabilityOfSnapshots
	| firstVersion secondVersion artifactId getShadowOfTrackedObject |
	self workingCopy
		add: 'this is a string' copy at: 'string';
		saveVersionWithMessage: 'add string'.
	firstVersion := self workingCopy baseVersion.
	artifactId := SquotToggles useNewApi ifTrue: [(self workingCopy artifactAt: 'string') id] ifFalse: ['string'].
	getShadowOfTrackedObject := SquotToggles useNewApi
		ifTrue: [[:version | (version snapshot snapshotArtifact: (self workingCopy artifactAt: 'string')) objectSnapshot startShadow]]
		ifFalse: [[:version | (version snapshot artifactAt: 'string') content startShadow]].
	(self workingCopy objectAt: 'string')
		replaceFrom: 9 to: 16 with: 'one line'. "this is one line"
	self assert: 'this is a string'
		equals: (getShadowOfTrackedObject value: firstVersion) value.
	self workingCopy saveVersionWithMessage: 'modify string'.
	secondVersion := self workingCopy baseVersion.
	self assert: 'this is one line'
		equals: (getShadowOfTrackedObject value: secondVersion) value.
	self assert: 'this is a string'
		equals: (getShadowOfTrackedObject value: firstVersion) value.
	self workingCopy loadVersion: firstVersion interactive: false.
	self assert: 'this is a string'
		equals: (self workingCopy objectAt: 'string').
	self assert: 'this is a string'
		equals: (getShadowOfTrackedObject value: firstVersion) value.
	self assert: 'this is one line'
		equals: (getShadowOfTrackedObject value: secondVersion) value.