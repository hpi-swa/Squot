actions
ensureCredentials: repository remoteUrl: remoteUrl
	| newUser newPassword |
	(repository credentialsFor: remoteUrl) ifNotNil: [^ true].
	newUser := UIManager default request: 'Enter username'.
	newUser ifEmpty: [^ false].
	newPassword := UIManager default requestPassword: 'Enter password:'.
	newPassword ifEmpty: [^ false].
	repository addCredentialsFor: remoteUrl user: newUser password: newPassword.
	^ true