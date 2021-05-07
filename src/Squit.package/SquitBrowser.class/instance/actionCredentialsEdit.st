actions
actionCredentialsEdit
	| repository gitRepository remoteUrls repositoryUrl oldUser oldPassword newUser newPassword |
	self withUnitOfWork:
	[repository := self projectSelection repository.
	gitRepository := repository fsgitRepository.
	remoteUrls := repository remoteNames collect:
		[:each | (gitRepository remoteUrl: each)]
		thenSelect: [:each | each beginsWith: 'http'].
	repositoryUrl := SquotGUI
			chooseFrom: remoteUrls
			values: remoteUrls
			title: 'Choose Remotes (http/s only):'.
	repositoryUrl ifNil: [^ self].
	(repository credentialsFor: repositoryUrl)
		ifNotNil: [:credentials |
			oldUser := credentials first.
			oldPassword := credentials second]
		ifNil: [oldUser := ''. oldPassword := ''].
	newUser := SquotGUI request: 'Enter username' initialAnswer: oldUser.
	newUser ifEmpty: [^ self].
	newPassword := SquotGUI requestPassword: 'Enter password:'.
	newPassword ifEmpty: [^ self].
	repository addCredentialsFor: repositoryUrl user: newUser password: newPassword.
	self inform: 'Credentials updated successfully.']