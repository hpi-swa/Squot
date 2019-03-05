artifact locating
locateArtifactsForClass: aClass in: aDirectory
	"Look for *.package directories with .filetree files"
	| searchDirectories packageDirectories |
	searchDirectories := OrderedCollection with: aDirectory.
	packageDirectories := OrderedCollection new.
	[searchDirectories notEmpty] whileTrue:
		[searchDirectories removeFirst entries
			do: [:each | each isDirectory ifTrue:
							[((each basename endsWith: '.package')
								and: [each reference entries
										anySatisfy: 	[:eachEntry |
														eachEntry basename = '.filetree' and:
														[eachEntry isFile]]])
								ifTrue: [packageDirectories add: each reference]
								ifFalse: [searchDirectories addLast: each reference]]]].
	^ packageDirectories