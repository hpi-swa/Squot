workspace
evaluate: aString in: aPluggableWorkspace notifying: requestor
	| form |
	form := aPluggableWorkspace
				evaluate: aString
				notifying: requestor
				ifFail: [self inform: 'evaluating failed'. ^ false].
	(form isForm or: [form isNil]) ifFalse: [self inform: 'evaluation did not produce a Form or nil'. ^ false].
	self changeSet formToWrite: form.
	self addWorkspaceBindings: aPluggableWorkspace.
	^ true