user requests
requestAndStoreCredentialsFor: repository remoteUrl: remoteUrl ifCanceled: cancelBlock
	| newUser newPassword |
	newUser := SquotGUI request: 'Enter username'.
	newUser ifEmpty: [^ cancelBlock value].
	newPassword := SquotGUI requestPassword: 'Enter password:'.
	newPassword ifEmpty: [^ cancelBlock value].
	repository addCredentialsFor: remoteUrl user: newUser password: newPassword.
	^ repository credentialsFor: remoteUrl