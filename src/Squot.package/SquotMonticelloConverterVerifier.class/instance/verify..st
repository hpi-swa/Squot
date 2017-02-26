as yet unclassified
verify: aVersion
	| originMCVersion missingVersionInfo |
	[originMCVersion := pendingMCVersions
		detect: [:each | each info message withoutLineEndings = aVersion message withoutLineEndings]
		ifNone: [missingVersionInfo := missingMCVersions
				detect: [:each | each message withoutLineEndings = aVersion message withoutLineEndings]
				ifNone: [SquotMonticelloConversionProblem signal: 'Bogus version message or ancestry'.
					^ self].
			self flag: #hack. "the ensure block needs originMCVersion, so fake one"
			originMCVersion := FakeMCVersion new info: missingVersionInfo; yourself.
			^ self "skip snapshot comparison, since we have no snapshot to check against"].
	pendingMCVersions remove: originMCVersion ifAbsent: [].
	self verify: aVersion matches: originMCVersion.]
		ensure: [pendingVersions addAll: aVersion parents.
			originMCVersion
				ifNotNil: [self pushAncestorsOfMCVersionInfo: originMCVersion info]].