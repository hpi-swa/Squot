private
withCredentialsHandlingDo: aBlock
	^ aBlock
		on: NeedGitCredentials do: [:e | | credentials |
			credentials :=
				self requestAndStoreCredentialsFor: workingCopy repository
					remoteUrl: e repositoryUrl asString.
			e resume: credentials]