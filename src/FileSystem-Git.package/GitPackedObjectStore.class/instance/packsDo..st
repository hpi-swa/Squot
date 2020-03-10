private
packsDo: aBlock		
	[self packs do: [ :pack | aBlock value: pack ]]
		on: FileDoesNotExist do:
			[:error | self flushCaches.
			error retry].