private loading
loadMonticelloClassSnapshot: anMCSnapshot from: anArtifact replacing: aClass
	| packageDirectory packageName pathElements classDefinition classSnapshot patch packageLoader |
	self assert: ((aClass isKindOf: ClassDescription) or: [aClass isNil]).
	packageDirectory := (pathElements := anArtifact path splitBy: '/') at: pathElements size - 1.
	packageName := packageDirectory allButLast: '.package' size.
	classDefinition := anMCSnapshot definitions detect: [:each | each isClassDefinition].
	self assert: (self environment classOrTraitNamed: classDefinition className) == aClass.
	classSnapshot := self mcSnapshotForSingleClass: aClass.
	patch := anMCSnapshot patchRelativeToBase: classSnapshot.
	packageLoader := MCPackageLoader new.
	patch applyTo: packageLoader.
	packageLoader loadWithNameLike: classDefinition className.
	^ classDefinition actualClass