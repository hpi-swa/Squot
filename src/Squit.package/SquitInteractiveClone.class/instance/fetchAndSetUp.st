running
fetchAndSetUp
	repository git branchNames ifNotEmpty:
		[(self confirm: 'The selected local repository already contains commits!', String cr, 'Do you really want to set ', remoteUrl, ' as the origin remote ', String cr, 'and reset all local branches?')
			ifFalse: [^ nil]].
	self handleRemoteErrorsWhile:
		[[self handlingCredentialsOf: repository
			do: [repository cloneFrom: remoteUrl]
			ifCanceled: [^ nil "nothing cloned"]]
			on: GitRemoteResourceNotFound do:
				[:e | self errorRemoteResourceNotFound: e. ^ nil "nothing cloned"]]
		afterErrorDo: [^ nil "gave up, nothing cloned"].