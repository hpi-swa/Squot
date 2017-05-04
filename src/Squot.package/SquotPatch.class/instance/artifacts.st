snapshot
artifacts
	"Answer my original artifacts and the newly added artifacts."
	^ diffs collect: [:each | each left ifNil: [each right]]