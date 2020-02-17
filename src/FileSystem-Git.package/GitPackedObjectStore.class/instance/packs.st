private
packs
	packFiles := OrderedCollection new.
	self packsDir files 
		select: [ :file | file basename endsWith: '.pack' ]
		thenDo: [ :packfile | packFiles add: (GitPackFile on: packfile in: self) ].
	^ packFiles