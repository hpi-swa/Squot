ui diff tree
rootNodes
	| packageNodes |
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := OrderedCollection new.
	editedPatch containerConflicts,
	editedPatch containerModifications,
	editedPatch elementMerges
		do:
			[:each | | root |
			root := each asDiffTree.
			each setUpTreeRoot: root toEditMerge: editedPatch.
			root withAllChildren do: [:eachNode | eachNode workingCopy: workingCopy].
			rootNodes add: root].
	
	packageNodes := ((rootNodes select: [:each | each artifactDiff notNil]) select: [:each | (each content isModification or: [each content isMerge]) and: [each content object storeInfo objectClassName = #PackageInfo]]).
	self excludeMethodsWithOnlyTimestampChanges: packageNodes.
	self excludePackagesWithoutActiveChanges: packageNodes.
	
	rootNodes addAll: self createLoadOrderNodes.
	^ rootNodes