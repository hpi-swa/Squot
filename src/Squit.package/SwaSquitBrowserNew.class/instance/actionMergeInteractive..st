actions
actionMergeInteractive: aBoolean

	self withUnitOfWork: [
		self selectedRepository 
			loadVersion: self selectedCommit
			interactive: aBoolean].