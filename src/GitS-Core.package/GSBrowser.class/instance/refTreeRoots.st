ui
refTreeRoots
	| roots |
	roots := self activeWorkingCopy ifNotNil: #refTreeRoots ifNil: [^ {}].
	self ensureActiveRefTreeMemberIdentityIn: roots.
	^ roots