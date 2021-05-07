private
fetchFromUpstream
	self handleRemoteErrorsWhile:
		[self handlingCredentialsOf: self workingCopy repository
			do: [localHistorian importFromUpstream]
			ifCanceled: [^ nil]]
		afterErrorDo: [^ nil].