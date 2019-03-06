*SquotTonel-Core-guessing
findTonelPackageDirectories
	"Look for directories with package.st"
	| searchDirectories packageDirectories |
	searchDirectories := OrderedCollection with: directory.
	packageDirectories := OrderedCollection new.
	[searchDirectories notEmpty] whileTrue:
		[searchDirectories removeFirst entries
			do: [:each | each isDirectory ifTrue:
							[(each reference entries
								anySatisfy: 	[:eachEntry |
												eachEntry basename = 'package.st' and:
												[eachEntry isFile]])
								ifTrue: [packageDirectories add: each reference]
								ifFalse: [searchDirectories addLast: each reference]]]].
	^ packageDirectories