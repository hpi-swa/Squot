as yet unclassified
privateAsConflicts

	self diffs: (self diffs collect: [:each | LBGitFileConflict left: nil right: each]).