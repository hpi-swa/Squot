loading
loadDefinitions

	| newDefinitions |
	
	newDefinitions := OrderedCollection new.
	
	self classFolders do: [:classFolder |
		MCGitClassReader loadDefinitionsFrom: classFolder into: newDefinitions ].
	
	^ newDefinitions
	
	"self flag: 'properly reconstruct the definitions from the repository data'.
	^ ( MCStReader on: (self reference / 'source.st') readStream) definitions"