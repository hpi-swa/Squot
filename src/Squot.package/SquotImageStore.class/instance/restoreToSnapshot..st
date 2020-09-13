Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace current objects with their versions from the snapshot"
	| restoredPaths |
	restoredPaths := Set new.
	self flag: #TODO. "investigate how to drop the environment from image store"
	self environment beCurrentDuring: [
		SquotProgress display: 'Loading objects into memory'
			for: aSnapshot artifactsInLoadOrder
			do: 	[:each |
				self restoreObjectFrom: each.
				restoredPaths add: each path]].
	(self objectPaths copyWithoutAll: restoredPaths)
		do: [:path | self remove: (self objectAt: path)].