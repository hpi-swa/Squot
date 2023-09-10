ui
getCommitMessageIfInvalid: aBlock
	self commitMessage ifEmpty: [self inform: 'Empty commit message, aborting.'. ^ aBlock value].
	self commitMessage = self defaultCommitMessage
		ifTrue: [(self confirm: ({
					'You have not changed the commit message:'.
					String tab, self commitMessage printString.
					'Do you really want to continue?'
				} joinSeparatedBy: Character lf))
					ifFalse: [^ aBlock value]].
	^ self commitMessage