private
handlingCredentialsOf: aRepository do: aBlock ifCanceled: cancelBlock
	| urlOfAddedCredentials urlToRemoveCredentialsFrom |
	[aBlock
	on: NeedGitCredentials do:
		[:e | | credentials |
		credentials :=
			self requestAndStoreCredentialsFor: aRepository
				remoteUrl: e repositoryUrl asString
				ifCanceled: cancelBlock.
		urlOfAddedCredentials := e repositoryUrl asString.
		e resume: credentials]
	on: GitRemoteAuthenticationFailed do:
		[:e | (self errorRemoteAuthenticationFailed: e)
			ifNil: "Cancel --> Let sender deal with the exception"
				[urlToRemoveCredentialsFrom := urlOfAddedCredentials.
				e pass]
			ifNotNil: "Retry"
				[self requestAndStoreCredentialsFor: aRepository
					remoteUrl: urlOfAddedCredentials
					ifCanceled:
						[urlToRemoveCredentialsFrom := urlOfAddedCredentials.
						e pass].
				e retry]]]
	ifCurtailed:
		[urlToRemoveCredentialsFrom ifNotNil:
			[aRepository removeCredentialsFor: urlToRemoveCredentialsFrom]]