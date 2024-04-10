testing
ifRepositoryDoesNotExist: aBlock
	self repositoryExists ifTrue: [^ nil].
	(self confirm:
		('The repository ''{1}'' has disappeared from the disk (it was at {2}). ',
		'Do you want to select a new location? ',
		'If you cancel, the repository will be removed from the Git Browser.'
			format: {self name. self repository baseDir}))
		ifTrue: [
			self requestAndMoveToNewRepositoryLocation.
			^ self ifRepositoryDoesNotExist: aBlock].
	self unregister.
	^ aBlock value