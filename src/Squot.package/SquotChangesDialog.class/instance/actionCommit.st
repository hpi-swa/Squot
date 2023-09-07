actions
actionCommit
	| message commit |
	self isSameHeadCommit
		ifFalse: [self inform: 'These changes are outdated. Aborting.'. ^ nil].
	message := self getCommitMessageIfInvalid: [^ nil].
	self hasConflicts ifTrue: [self inform: 'There are conflicts. Please resolve them before committing. Aborting.'. ^ nil].
	commit := self commitChangeSetsWithMessage: message.
	self close.
	^ commit