private
handlingCredentialsOf: aRepository do: aBlock ifCanceled: cancelBlock
	| urlOfAddedCredentials urlToRemoveCredentialsFrom |
	[
		aBlock
		on: NeedGitCredentials do:
			[:e | | credentials |
			credentials :=
				self requestAndStoreCredentialsFor: aRepository
					remoteUrl: e repositoryUrl asString
					ifCanceled: cancelBlock.
			urlOfAddedCredentials := e repositoryUrl asString.
			e resume: credentials]
		on: GitRemoteAuthenticationFailed do:
			[:e | "register credentials for removal if they were just added"
			urlToRemoveCredentialsFrom := urlOfAddedCredentials.
			e pass]
	]
	ifCurtailed:
		[urlToRemoveCredentialsFrom ifNotNil:
			[[aRepository removeCredentialsFor: urlToRemoveCredentialsFrom]
				on: KeyNotFound do: []]]