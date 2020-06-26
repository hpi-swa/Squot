private
withRemoteErrorHandlingDo: aBlock
	^ [aBlock
		on: GitRemoteAuthenticationFailed
		do: 	[:e | self errorRemoteAuthenticationFailed: e]
		on: GitRemoteResourceNotFound
		do: [:e | self errorRemoteResourceNotFound: e]]
		ifCurtailed:
			[self abandoned]