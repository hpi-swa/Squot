actions
actionProjectClone
	| workingCopy remoteUrl |
	remoteUrl := UIManager default request: 'URL to clone from:'.
	(self isRemoteSupported: remoteUrl)
		ifFalse: [^ self inform: 'This URL is not supported at the moment.'].
	workingCopy := self addProjectIfCanceled: [^ self].
	workingCopy repository gitRepository cloneFrom: remoteUrl.
	self refresh.