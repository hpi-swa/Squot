refs
checkCanDeleteRef: aString
	(self isSomeHead: aString) ifTrue: [
		self inform: 'You cannot delete HEAD.'. ^ false].
	(self isReferencedByHead: aString) ifTrue: [
		self inform: 'You cannot delete the branch you are currently on.'. ^ false].
	^ true