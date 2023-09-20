evaluation
evaluate: aString notifying: requestor
	| version |
	version := self
				evaluate: aString
				notifying: requestor
				ifFail: [self inform: 'evaluating failed'. ^ false].
	(self isValidVersion: version) ifFalse: [
		self inform: 'evaluation did not produce a ', self versionTypeName.
		^ false].
	self version: version.
	self addBindings.
	^ true