actions
actionCreateGitBranchAtRef: aString
	| commit |
	commit := (self commitReferencedBy: aString to: 'create an external branch') ifNil: [^ nil].
	^ self actionCreateGitBranchAtCommit: commit fromRef: aString