private
packsDo: aBlock		
	[self packs do: [ :pack | aBlock value: pack ]]
		on: FileDoesNotExist do:
			[:error | packFiles := nil "flush cache".
			error retry].