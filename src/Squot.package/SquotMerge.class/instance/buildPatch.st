Patch facade
buildPatch
	"Conflicts are not included, effectively resolving them as 'mine'"
	containerConflicts
		select: [:each | each isResolved]
		thenDo: [:each | patchBuilder resetAt: each path; addDiff: each resolution].
	containerConflicts
		select: [:each | each isResolved not]
		thenDo: [:each | patchBuilder resetAt: each path].
	^ patchBuilder buildPatch