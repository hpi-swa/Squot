actions on working copies
actionProjectClone
	| workingCopy remoteUrl |
	remoteUrl := UIManager default request: 'URL to clone from:' initialAnswer: Clipboard clipboardText.
	(self isRemoteSupported: remoteUrl)
		ifFalse: [^ self inform: 'This URL is not supported at the moment.'].
	workingCopy := self addProjectIfCanceled: [^ self].
	workingCopy repository withUnitOfWork:
	[workingCopy repository git branchNames
		ifNotEmpty: [(self confirm: 'The selected local repository already contains commits!', String cr, 'Do you really want to set ', remoteUrl, ' as the origin remote ', String cr, 'and reset all local branches?')
				ifFalse: [^ self refresh]].
	self withRemoteErrorHandlingDo:
		[self handlingCredentialsOf: workingCopy loadedHistorian
			do: [workingCopy repository cloneFrom: remoteUrl]
			ifCanceled: []].
	self refresh].