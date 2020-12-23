private
updateMetadataAfterSaving: aVersion
	"Some repositories cause additional metadata to be added when saving an artifact for the first time. Bring this into the working copy."
	| previousVersion added |
	previousVersion := self loadedVersion.
	previousVersion
		ifNil: [added := aVersion artifacts]
		ifNotNil: [added := aVersion artifacts reject: [:each | previousVersion includesObjectAt: each path]].
	(added select: [:each | self includesObjectAt: each path]) do:
		[:each | | diff artifact new |
		artifact := self artifactAt: each path.
		diff := artifact storeInfo squotDiffAgainst: each storeInfo. self flag: #encapsulation. "storeInfo access"
		new := diff squotApplyTo: artifact storeInfo.
		self flag: #generality. "Don't switch on the artifact type below. Use something like absorbDiff: instead."
		artifact isLoaded
			ifTrue:
				["Don't overwrite transient properties."
				new keysAndValuesDo:
					[:key :value |
					(artifact liveStoreInfo at: key ifAbsent: []) = (diff left at: key ifAbsent: []) ifTrue:
						[artifact liveStoreInfo at: key put: value]]]
			ifFalse: [artifact storeInfo: new]].