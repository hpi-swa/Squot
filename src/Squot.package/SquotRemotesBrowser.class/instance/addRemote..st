actions
addRemote: aGitRemote
	self unitOfWork addRemote: (aGitRemote ifNil: [^ self]).
	(self confirm: ('Do you want to fetch the new remote ''{1}'' now?' format: {aGitRemote name}))
		ifTrue: [self workingCopy fetch: aGitRemote name].