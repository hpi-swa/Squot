private
fetch
	remoteNames ifNil: [^ self error: 'Incompletely initialzed: Remote names missing'].
	[self
		handleRemoteErrorsWhile:
			[self handlingCredentialsOf: repository
				do: [repository importFromAll: remoteNames]
				ifCanceled: [^ nil]]
		afterErrorDo: [^ nil]]
		on: GitNothingToFetch do:
			[:e | self inform: 'There are no branches at the remote, so nothing was fetched.'.
			"This is not an error case, just for information. So do not return nil here."].
	self flag: #todo. "In the future, might collect all updated refs and return that."