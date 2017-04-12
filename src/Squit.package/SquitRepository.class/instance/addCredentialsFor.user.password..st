synchronizing
addCredentialsFor: repositoryUrlString user: userNameString password: passwordString
	credentials at: repositoryUrlString put: (Array with: userNameString with: passwordString)