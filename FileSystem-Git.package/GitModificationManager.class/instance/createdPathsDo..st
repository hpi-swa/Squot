enumerating
createdPathsDo: aBlock	
	| tree |
	createdPaths associations do: [ :assoc | 
		tree := self treeAt: assoc key. 
		assoc value do: [ :path |
			aBlock 
				value: tree
				value: path ] ]