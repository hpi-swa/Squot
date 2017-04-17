accessing-packs
packs
	^ packs ifNil: [
		packs := OrderedCollection new.
		self packsDir files 
			reject: [ :file | file basename endsWith: '.idx' ]
			thenDo: [ :packfile | packs add: (GitPackFile on: packfile in: self) ].
		packs]
