private
packs
	^ packFiles
		ifNil:
			[packFiles := OrderedCollection new.
			self packsDir files 
				select: [ :file | file basename endsWith: '.pack' ]
				thenDo: [ :packfile | packFiles add: (GitPackFile on: packfile in: repository) ].
			packFiles]