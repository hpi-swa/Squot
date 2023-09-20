workspace
evaluate: aString in: aPluggableWorkspace notifying: requestor
	| version |
	version := aPluggableWorkspace
				evaluate: aString
				notifying: requestor
				ifFail: [self inform: 'evaluating failed'. ^ false].
	(self isValidVersion: version) ifFalse: [
		self inform: 'evaluation did not produce a ', self versionTypeName.
		^ false].
	self changeSet versionToWrite: version.
	self addWorkspaceBindings: aPluggableWorkspace.
	^ true