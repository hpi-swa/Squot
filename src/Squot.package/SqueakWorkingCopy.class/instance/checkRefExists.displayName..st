refs
checkRefExists: refName displayName: displayName
	(self unitOfWork refExists: refName) ifFalse: [^ false].
	(self confirm: ('''{1}'' already exists. Do you want to overwrite it?' format: {displayName}))
		ifTrue: [^ false "act as if the ref does not exist"].
	^ true