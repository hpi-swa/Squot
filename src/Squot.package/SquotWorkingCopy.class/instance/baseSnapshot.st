creating new versions
baseSnapshot
	"Compose a lazy snapshot from caches and the baseVersion"
	| baseVersionSnapshot |
	baseVersionSnapshot := (self baseVersion ifNil: [^ SquotSnapshot empty]) lazySnapshot.
	self addGlobalObjectsToStore: baseVersionSnapshot.
	self lastLoadedHistorian version ~= self baseVersion
		ifTrue: [^ baseVersionSnapshot].
	^ baseVersionSnapshot createNewBuilder
		addAll: (self previouslySavedArtifacts
			associationsSelect: [:each | baseVersionSnapshot includesObjectAt: each key]);
		buildSnapshot