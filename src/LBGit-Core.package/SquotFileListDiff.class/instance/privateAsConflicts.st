as yet unclassified
privateAsConflicts

	self diffs: (self diffs collect: [:each | SquotFileConflict left: nil right: each]).