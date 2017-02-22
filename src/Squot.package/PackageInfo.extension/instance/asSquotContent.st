*squot
asSquotContent
	self flag: #hack.
	^ self workingCopy package snapshot
		in: [:snapshot | "sort definitions for Artifact comparison"
			MCSnapshot fromDefinitions: snapshot definitions sorted]