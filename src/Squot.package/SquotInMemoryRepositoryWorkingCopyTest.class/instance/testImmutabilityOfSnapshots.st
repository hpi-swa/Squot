testing
testImmutabilityOfSnapshots
	| firstVersion secondVersion |
	self workingCopy
		add: 'this is a string' copy at: 'string';
		saveNewVersionMessage: 'add string' interactive: false.
	firstVersion := self workingCopy baseVersion.
	(self workingCopy objectAt: 'string')
		replaceFrom: 9 to: 16 with: 'one line'. "this is one line"
	self assert: 'this is a string'
		equals: (firstVersion snapshot artifactAt: 'string') content startShadow value.
	self workingCopy saveNewVersionMessage: 'modify string' interactive: false.
	secondVersion := self workingCopy baseVersion.
	self assert: 'this is one line'
		equals: (secondVersion snapshot artifactAt: 'string') content startShadow value.
	self assert: 'this is a string'
		equals: (firstVersion snapshot artifactAt: 'string') content startShadow value.
	self workingCopy loadVersion: firstVersion interactive: false.
	self assert: 'this is a string'
		equals: (self workingCopy objectAt: 'string').
	self assert: 'this is a string'
		equals: (firstVersion snapshot artifactAt: 'string') content startShadow value.
	self assert: 'this is one line'
		equals: (secondVersion snapshot artifactAt: 'string') content startShadow value.