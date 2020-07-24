private
requestAndStoreCredentialsFor: repository remoteUrl: remoteUrl
	| newUser newPassword |
	newUser := SquotGUI request: 'Enter username'.
	newUser ifEmpty: [^ self cancel].
	newPassword := SquotGUI requestPassword: 'Enter password:'.
	newPassword ifEmpty: [^ self cancel].
	repository addCredentialsFor: remoteUrl user: newUser password: newPassword.
	^ repository credentialsFor: remoteUrl