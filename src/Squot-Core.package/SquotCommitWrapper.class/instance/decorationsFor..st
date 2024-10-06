initialization
decorationsFor: aCommit
	^ ((((self workingCopy refsForCommit: aCommit)
		collect: [:each | GitReference shortName: each])
		copyWithout: 'HEAD')
		collect: [:each | '[', each, '] '])
		join