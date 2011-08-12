showing
visitNextEntry: entry
	entry isFile 
		ifTrue: [ ^ visitor visitFile: entry ].
	
	visitor visitDirectory: entry.
	work addAll: entry reference entries.