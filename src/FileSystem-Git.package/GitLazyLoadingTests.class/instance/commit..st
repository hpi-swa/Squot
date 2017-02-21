helpers
commit: message
	[ [ workingCopy commit: message ]
		on: GitStampNameRequest 
		do: [ :req | req resume: 'Homer Simpson' ] ]
			on: GitStampEmailRequest 
			do: [ :req | req resume: 'homer@nuke.com' ]