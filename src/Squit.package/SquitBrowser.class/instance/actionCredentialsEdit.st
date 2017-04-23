actions
actionCredentialsEdit
	| repository gitRepository remoteUrls repositoryUrl oldUser oldPassword newUser newPassword |
	repository := self projectSelection repository.
	gitRepository := repository gitRepository.
	remoteUrls := gitRepository remoteNames collect:
		[:each | (gitRepository remoteUrl: each)]
		thenSelect: [:each | each beginsWith: 'http'].
	repositoryUrl := UIManager default
			chooseFrom: remoteUrls
			values: remoteUrls
			title: 'Choose Remotes (http/s only):'.
	repositoryUrl ifNil: [^ self].
	(repository credentialsFor: repositoryUrl)
		ifNotNil: [:credentials |
			oldUser := credentials first.
			oldPassword := credentials second]
		ifNil: [oldUser := ''. oldPassword := ''].
	newUser := UIManager default request: 'Enter username' initialAnswer: oldUser.
	newUser ifEmpty: [^ self].
	newPassword := UIManager default requestPassword: 'Enter password:'.
	newPassword ifEmpty: [
		oldPassword "Keep old password if unchanged"
			ifNotEmpty: [newPassword := oldPassword]
			ifEmpty: [^ self]].
	repository addCredentialsFor: repositoryUrl user: newUser password: newPassword.
	self inform: 'Credentials updated successfully.'