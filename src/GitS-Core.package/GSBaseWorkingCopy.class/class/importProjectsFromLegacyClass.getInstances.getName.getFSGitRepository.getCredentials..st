migrations
importProjectsFromLegacyClass: aSymbol
getInstances: instancesBlock
getName: nameBlock
getFSGitRepository: repositoryBlock
getCredentials: credentialsBlock
	(instancesBlock value: ((Smalltalk classNamed: aSymbol) ifNil: [^ self]))
		do: [:each |
			(GSGitWorkingCopy
				onFSGitRepository: (repositoryBlock value: each)
				named: (nameBlock value: each))
					credentials: (credentialsBlock value: each);
					register]
		displayingProgress: [:each | 'Registering legacy project {1}'
										format: {(nameBlock value: each) printString}].