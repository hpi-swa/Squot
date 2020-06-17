private
handlingCredentialsOf: aRepository do: aBlock ifCanceled: cancelBlock
	aBlock
	on: NeedGitCredentials do: [:e | | credentials |
		credentials :=
			self requestAndStoreCredentialsFor: aRepository
				remoteUrl: e repositoryUrl asString
				ifCanceled: cancelBlock.
		e resume: credentials]