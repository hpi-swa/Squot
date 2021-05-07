helpers
branch: branchName message: aMessage
	self withUnitOfWork: [:git |
	[ [ workingCopy branch: branchName message: aMessage ] 
		on: GitStampNameRequest
		do: [ :req | req resume: 'Homer Simpson' ] ]
			on: GitStampEmailRequest 
			do: [ :req | req resume: 'homer@nuke.com' ]
	].