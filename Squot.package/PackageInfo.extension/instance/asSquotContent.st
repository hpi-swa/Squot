*squot
asSquotContent
	self flag: #hack.
	^ self mcPackage snapshot
		in: [:snapshot | "sort definitions for Artifact comparison"
			MCSnapshot fromDefinitions: snapshot definitions sorted]