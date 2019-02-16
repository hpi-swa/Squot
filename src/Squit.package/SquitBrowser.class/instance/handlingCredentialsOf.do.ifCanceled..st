private
handlingCredentialsOf: aHistorian do: aBlock ifCanceled: cancelBlock
	aBlock
	on: NeedGitCredentials do: [:e | | credentials |
		credentials :=
			self requestAndStoreCredentialsFor: aHistorian repository
				remoteUrl: e repositoryUrl asString
				ifCanceled: cancelBlock.
		e resume: credentials]