working copy registry
register: aWorkingCopy
	(registry ifNil: [registry := OrderedCollection new]) add: aWorkingCopy.