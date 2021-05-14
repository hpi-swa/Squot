test objects
patchModifyingMethodTimestampInArtifactAt: path
	| before after |
	before := SquotSnapshot builder
		add: (((MCSnapshot fromDefinitions: {
				MCMethodDefinition className: 'TestClass' classIsMeta: false selector: 'a'
					category: 'changed stamps' timeStamp: '1' source: 'a'.
			}) asSquotArtifactForPackage: (PackageInfo new packageName: 'TestPackage'))
				path: path);
		buildSnapshot.
	after := SquotSnapshot builder
		add: (((MCSnapshot fromDefinitions: {
				MCMethodDefinition className: 'TestClass' classIsMeta: false selector: 'a'
					category: 'changed stamps' timeStamp: '2' source: 'a'.
			}) asSquotArtifactForPackage: (PackageInfo new packageName: 'TestPackage'))
				path: path);
		buildSnapshot.
	^ after patchRelativeToBase: before