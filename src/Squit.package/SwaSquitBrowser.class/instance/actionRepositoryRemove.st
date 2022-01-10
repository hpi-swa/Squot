actions
actionRepositoryRemove

	| repository |
	repository := self selectedRepository ifNil: [^ self].
	(self confirm: 'Really delete project ', repository name, '?')
		ifFalse: [^ self].
	repository unregister.
	self repositoryListIndex: (self repositoryListIndex min: self projectList size).
	self hasRepositories ifFalse: [self refresh].

	