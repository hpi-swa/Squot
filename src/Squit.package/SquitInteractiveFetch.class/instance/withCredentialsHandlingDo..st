private
withCredentialsHandlingDo: aBlock
	^ aBlock
		on: NeedGitCredentials do: [:e | | credentials |
			credentials :=
				self requestAndStoreCredentialsFor: repository
					remoteUrl: e repositoryUrl asString.
			e resume: credentials]