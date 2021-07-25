private
detectStartObjectReplacement: leftStartShadow with: rightStartShadow
	(shadowNames at: leftStartShadow undecorated) ~= (shadowNames at: rightStartShadow undecorated)
		ifTrue:
			["Start objects have different identities."
			| newName diff |
			newName := shadowNames at: rightStartShadow undecorated.
			diff := self diffFrom: leftStartShadow to: rightStartShadow
				ifNew: [SquotObjectReplacement left: leftStartShadow right: rightStartShadow]
				andInitialize: []].