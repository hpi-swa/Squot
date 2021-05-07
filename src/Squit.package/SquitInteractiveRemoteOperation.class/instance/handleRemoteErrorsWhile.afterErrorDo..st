error handling
handleRemoteErrorsWhile: aBlock afterErrorDo: errorBlock.
	[aBlock
		on: GitRemoteAuthenticationFailed 	do: 
			[:e | self errorRemoteAuthenticationFailed: e. errorBlock cull: e]
		on: GitRemoteResourceNotFound do:
			[:e | self errorRemoteResourceNotFound: e. errorBlock cull: e]]
		on: GitPushFailed do:
			[:e | self errorPushFailed: e. errorBlock cull: e]
		on: GitRemoteUndefined do:
			[:e | self errorRemoteUndefined: e. errorBlock cull: e]