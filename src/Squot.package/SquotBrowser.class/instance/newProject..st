actions
newProject: aWorkingCopy
	| headCommit |
	aWorkingCopy ifNil: [^ self].
	self activeWorkingCopy: aWorkingCopy.
	headCommit := aWorkingCopy headCommit.
	headCommit ifNotNil: [
		(self confirm: 'Do you want to materialize the current commit?') ifTrue: [
			self
				activeCommit: headCommit;
				actionMaterializeActiveCommit]].