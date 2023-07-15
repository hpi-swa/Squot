test objects
patchModifyingMethodTimestampInArtifactAt: path
	| artifactBefore artifactAfter before after |
	artifactBefore := (MCSnapshot fromDefinitions: {
			MCMethodDefinition className: 'TestClass' classIsMeta: false selector: 'a'
				category: 'changed stamps' timeStamp: '1' source: 'a'.
		}) asSquotArtifactForPackage: (PackageInfo new packageName: 'TestPackage').
	artifactAfter := (MCSnapshot fromDefinitions: {
			MCMethodDefinition className: 'TestClass' classIsMeta: false selector: 'a'
				category: 'changed stamps' timeStamp: '2' source: 'a'.
		}) asSquotArtifactForPackage: (PackageInfo new packageName: 'TestPackage').
	SquotToggles useNewApi
		ifTrue:
			[artifactAfter artifact id: artifactBefore artifact id.
			before := SquotProjectSnapshot fromStore:
				(SquotSnapshotStore
					project: (SquotProject id: UUID new metadata: Dictionary new artifacts: {artifactBefore artifact id -> artifactBefore artifact})
					artifactSnapshots: {artifactBefore artifact id -> artifactBefore}).
			after := SquotProjectSnapshot fromStore:
				(SquotSnapshotStore
					project: before project
					artifactSnapshots: {artifactAfter artifact id -> artifactAfter})]
		ifFalse:
			[before := SquotSnapshot builder
				add: (artifactBefore
						path: path);
				buildSnapshot.
			after := SquotSnapshot builder
				add: (artifactAfter
						path: path);
				buildSnapshot].
	^ after patchRelativeToBase: before