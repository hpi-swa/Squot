initialize-release
initializeHead
	self headRef ifNil: [
		self unitOfWork
			updateRef: self headRefName
			toRef: (self branchName: 'main')].