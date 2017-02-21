git-delegating
branch: branchName message: message andTag: tagName
	self
		branch: branchName
		message: message.
	self 
		tagRevision: self
		with: tagName