actions
actionProjectClone
	| workingCopy remoteUrl |
	remoteUrl := UIManager default request: 'URL to clone from:'.
	(self isRemoteSupported: remoteUrl)
		ifFalse: [^ self inform: 'This URL is not supported at the moment.'].
	workingCopy := self addProjectIfCanceled: [^ self].
	workingCopy repository gitRepository branchNames
		ifNotEmpty: [(self confirm: 'The selected local repository already contains commits!', String cr, 'Do you really want to set ', remoteUrl, ' as the origin remote ', String cr, 'and reset all local branches?')
				ifFalse: [^ self refresh]].
	workingCopy repository gitRepository cloneFrom: remoteUrl.
	self refresh.