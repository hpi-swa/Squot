Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace current objects with their versions from the snapshot"
	| deserializer objectFromSnapshot reference |
	objects keysAndValuesDo: [:path :object |
		reference := self referenceTo: path in: aSnapshot.
		deserializer := self deserializerForObjectAt: reference.
		objectFromSnapshot := deserializer readFrom: reference.
		self restore: object to: objectFromSnapshot].