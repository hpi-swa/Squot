working copy registry
register: aWorkingCopy
	(registry ifNil: [registry := IdentitySet new]) add: aWorkingCopy.