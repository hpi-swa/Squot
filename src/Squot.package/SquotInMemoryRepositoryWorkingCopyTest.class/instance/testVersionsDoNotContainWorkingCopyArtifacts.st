testing
testVersionsDoNotContainWorkingCopyArtifacts
	| firstVersion |
	self workingCopy
		addUnloaded: (SquotImageStore new
						add: 'this is a string' copy at: 'string';
						artifactAt: 'string') capture;
		saveVersionWithMessage: 'add string'.
	firstVersion := self workingCopy baseVersion.
	self deny: ((firstVersion artifactAt: 'string') respondsTo: #isLoaded);
		assert: ((self workingCopy artifactAt: 'string') respondsTo: #isLoaded).