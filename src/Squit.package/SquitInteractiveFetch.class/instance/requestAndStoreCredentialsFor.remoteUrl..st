private
requestAndStoreCredentialsFor: repository remoteUrl: remoteUrl
	| newUser newPassword |
	newUser := UIManager default request: 'Enter username'.
	newUser ifEmpty: [^ self cancel].
	newPassword := UIManager default requestPassword: 'Enter password:'.
	newPassword ifEmpty: [^ self cancel].
	repository addCredentialsFor: remoteUrl user: newUser password: newPassword.
	^ repository credentialsFor: remoteUrl