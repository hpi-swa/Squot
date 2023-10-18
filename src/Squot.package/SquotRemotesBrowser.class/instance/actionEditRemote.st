actions
actionEditRemote
	self selectedRemoteName ifNil: [^ self].
	self withUnitOfWork: [| remote newRemote |
		remote := self selectedRemote.
		newRemote := SquotRemoteDialog
							getRemoteWithTitle: 'Edit Remote'
							name: remote name
							url: remote url.
		newRemote ifNotNil: [
			newRemote name = remote name ifFalse: [
				"only remove the remote if the name changes, otherwise the refs can be kept"
				self unitOfWork removeRemoteNamed: remote name].
			self addRemote: newRemote]].