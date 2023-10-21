evaluation
evaluate: aString notifying: requestor
	| version |
	version := self
				evaluate: aString
				notifying: requestor
				ifFail: [self inform: 'evaluating failed'. ^ false].
	(version isNil or: [self isValidVersion: version]) ifFalse: [
		self inform: 'evaluation did not produce a ', self versionOrNilTypeName.
		^ false].
	self version: (self transformVersion: version ifFail: [^ false]).
	self addBindings.
	^ true