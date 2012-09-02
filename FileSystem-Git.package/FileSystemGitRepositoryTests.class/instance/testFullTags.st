tests
testFullTags
	| commit tags tag|
	commit := basicRepository objectNamed: (basicRepository resolveRef: 'refs/heads/branch1').
	[[ tag := GitTag
		makeFullTag: 'version 4.3alpha'
		for: commit
		message: 'PGP encrypted string'
		in: basicRepository ] 
			on: GitStampNameRequest 
			do: [ :req | req resume: 'Homer Simpson' ]]
				on: GitStampEmailRequest
				do: [ :req | req resume: 'homer@nuke.com' ].
			
	tags := repository tags.
	
	self assert: tags size = 1.
	
	self assert: tags keys first equals: tag.
	self assert: tags values first species equals: GitFilesystem.
	self assert: tags values first revision equals: commit.