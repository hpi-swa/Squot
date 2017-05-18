public-locations
workingCopyDir
	| worktree |
	self hasWorkingCopy ifFalse: [GitError signal: 'Repository does not have a working copy'].
	worktree := self configAt: 'core.worktree' ifAbsent: ['..'].
	^ self baseDir resolve: worktree