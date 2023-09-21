actions
actionRemoveActiveProject
	| workingCopy |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ self].
	(self confirm:
		('Do you really want to remove the project ''{1}''? ',
		'The files on disk will remain, but the project will be no longer be visible here.'
			format: {workingCopy name}))
		ifFalse: [^ self].
	workingCopy unregister.