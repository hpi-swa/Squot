accessing-packs
packs
	packs := OrderedCollection new.
	self packsDir files 
		select: [ :file | file basename endsWith: '.pack' ]
		thenDo: [ :packfile | packs add: (GitPackFile on: packfile in: self) ].
	^ packs