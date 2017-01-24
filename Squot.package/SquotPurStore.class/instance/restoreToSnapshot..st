Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace current objects with their versions from the snapshot"
	| deserializer restoredPaths |
	restoredPaths := Set new.
	self environment beCurrentDuring: [
		aSnapshot objectReferencesDo: [:each |
			deserializer := self deserializerForObjectAt: each.
			self restoreObjectFrom: each at: (aSnapshot pathOf: each) using: deserializer.
			restoredPaths add: each]].