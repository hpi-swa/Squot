upstream
initialRemoteRefNameFor: aString
	(self isSqueakBranchRef: aString) ifTrue: [^ aString allButFirst: self branchesBaseName size].
	(self isSqueakRef: aString) ifTrue: [^ aString allButFirst: self refsBaseName size].
	^ aString