private
onQueryClose: aSquitAddRemote
	aSquitAddRemote accepted ifFalse: [^ promise rejectWith: #cancelled].
	self withActiveUnitOfWork:
		[repository fsgitRepository
			addRemote: aSquitAddRemote remoteName asString
			url: aSquitAddRemote remoteUrl asString.
		self notifyRemoteAdded.
		(self requestFetchFromRemoteNamed: aSquitAddRemote remoteName)
			ifTrue: [self fetch]
			ifFalse: [promise resolveWith: aSquitAddRemote]].