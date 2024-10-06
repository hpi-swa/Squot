actions
actionCreateBranchAtRef: aString
	| commit |
	commit := (self commitReferencedBy: aString to: 'create a branch') ifNil: [^ nil].	
	^ self actionCreateBranchAtCommit: commit fromRef: aString