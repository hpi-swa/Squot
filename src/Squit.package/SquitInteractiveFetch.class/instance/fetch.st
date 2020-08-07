private
fetch
	remoteNames ifNil: [^ self error: 'Incompletely initialzed: Remote names missing'].
	self
		handleRemoteErrorsWhile:
			[self handlingCredentialsOf: repository
				do: [repository importFromAll: remoteNames]
				ifCanceled: [^ nil]]
		afterErrorDo: [^ nil].
	self flag: #todo. "In the future, might collect all updated refs and return that."