actions
actionEditRemote
	self selectedRemoteName ifNil: [^ self].
	self withUnitOfWork: [| remote |
		remote := self selectedRemote.
		self addRemote:
			(SquotRemoteDialog
				getRemoteWithTitle: 'Edit Remote'
				name: remote name
				url: remote url)].
