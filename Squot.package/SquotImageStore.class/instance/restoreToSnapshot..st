Pur store
restoreToSnapshot: aSnapshot
	"read objects from aSnapshot and update/replace current objects with their versions from the snapshot"
	| restoredPaths |
	restoredPaths := Set new.
	self environment beCurrentDuring: [
		aSnapshot artifactsDo: [:each |
			self restoreObjectFrom: each.
			restoredPaths add: each path]].