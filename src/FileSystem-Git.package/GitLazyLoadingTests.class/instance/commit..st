helpers
commit: message
	repository withUnitOfWork: [
	[ [ workingCopy commit: message ]
		on: GitStampNameRequest 
		do: [ :req | req resume: 'Homer Simpson' ] ]
			on: GitStampEmailRequest 
			do: [ :req | req resume: 'homer@nuke.com' ]
	].