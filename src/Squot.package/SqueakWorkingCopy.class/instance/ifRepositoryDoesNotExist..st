testing
ifRepositoryDoesNotExist: aBlock
	self repositoryExists ifTrue: [^ nil].
	self inform:
		('The repository ''{1}'' has disappeared from the disk (it was at {2}). ',
		'The repository will now be removed from the Git Browser.'
			format: {self name. self repository baseDir}).
	self unregister.
	^ aBlock value