refs
headRef
	^ self basicHeadRef ifNil: [
		self unitOfWork
			updateRef: self headRefName
			toRef: (self branchName: 'main').
		self basicHeadRef].