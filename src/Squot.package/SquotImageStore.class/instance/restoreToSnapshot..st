Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace current objects with their versions from the snapshot"
	| restoredPaths |
	restoredPaths := Set new.
	self flag: #TODO. "investigate how to drop the environment from image store"
	self environment beCurrentDuring: [
		aSnapshot artifactsInLoadOrder
			do: 	[:each |
				self restoreObjectFrom: each.
				restoredPaths add: each path]
			displayingProgress: 'Loading objects into memory'].
	(self objectPaths copyWithoutAll: restoredPaths)
		do: [:path | self remove: (self objectAt: path)].