tests
testVersionsDoNotContainWorkingCopyArtifacts
	| artifactId firstVersion |
	SquotToggles useNewApi
		ifTrue:
			[| snapshot |
			snapshot := (SquotValueHolderStore new contents: 'this is a string'; readArtifact: (SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdValueHeldAtPath: 'string'))).
			(self workingCopy putArtifact: snapshot artifact;
				useStoreImplementation: SquotSnapshotStore forArtifact: snapshot artifact;
				storeForArtifact: snapshot artifact) putArtifact: snapshot.
			artifactId := snapshot artifact id]
		ifFalse:
			[self workingCopy
				addUnloaded: (SquotImageStore new
								add: 'this is a string' copy at: 'string';
								artifactAt: 'string') capture.
				artifactId := 'string'].
	self workingCopy saveVersionWithMessage: 'add string'.
	firstVersion := self workingCopy baseVersion.
	SquotToggles useNewApi
		ifTrue:
			["With the new API there are no separate classes for working copy artifacts."
			self assert: ((self workingCopy storeForArtifact: (self workingCopy project artifactAt: artifactId)) isKindOf: SquotSnapshotStore)]
		ifFalse:
			[self deny: ((firstVersion artifactAt: 'string') respondsTo: #isLoaded);
				assert: ((self workingCopy artifactAt: 'string') respondsTo: #isLoaded)].