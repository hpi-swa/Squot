helpers
createSomeTrees
	| entries trees |
	entries := self createSomeTreeEntries.
	trees := OrderedCollection new.
	1 to: entries size do: [ :index || theEntries |
		theEntries := OrderedCollection new.
			1 to: index do: [ :innerIndex |
				theEntries add: (entries at: innerIndex) ].
		trees add: (GitTree entries: theEntries in: repository) ].
	
	trees do: [ :tree | tree store ].
	^ trees