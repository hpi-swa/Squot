helpers
commit: aMessage andTag: tagName
	[ [ workingCopy commit: aMessage andTag: tagName ] 
		on: GitStampNameRequest
		do: [ :req | req resume: 'Homer Simpson' ] ]
			on: GitStampEmailRequest 
			do: [ :req | req resume: 'homer@nuke.com' ]