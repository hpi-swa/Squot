Squot serialization
writeDiff: aSquotArtifactDiff
	| directory mcPatch newDefinitions classifierDefinitions missingClassifiers removedMethods removedClassifiers removedClassTraits removedOthers allMethods allClassifiers extensions classTraits missingClassTraits |
	aSquotArtifactDiff isAddition ifTrue: [^ self write: aSquotArtifactDiff right].
	aSquotArtifactDiff isRemoval ifTrue: [^ self notYetImplemented].
	self assert: aSquotArtifactDiff isModification.
	aSquotArtifactDiff content squotHasChanges ifFalse: [^ self "nothing to do"].
	directory := ((aSquotArtifactDiff right storeInfo at: #objectClassName ifAbsent: [#PackageInfo]) endsWith: ' class')
		ifTrue: [(rootDirectory resolve: aSquotArtifactDiff path) parent]
		ifFalse: [rootDirectory resolve: aSquotArtifactDiff path].
	self initializeFileTreeWritersInPackageDirectory: directory.
	removedMethods := Dictionary new.
	removedClassifiers := Dictionary new.
	removedClassTraits := Dictionary new.
	removedOthers := Dictionary new.
	classTraits := Dictionary new.
	mcPatch := aSquotArtifactDiff content startDiff patch.
	newDefinitions := OrderedCollection new: mcPatch operations size.
	mcPatch operations do:
		[:each |
		each isRemoval
			ifTrue: [	each definition isMethodDefinition ifTrue: [removedMethods at: each definition description put: each definition].
					each definition isClassDefinition ifTrue: [removedClassifiers at: each definition description put: each definition].
					(each definition isTraitDefinition and: [each definition isClassDefinition not]) ifTrue: [removedClassTraits at: each baseTrait put: each definition].
					(each definition isMethodDefinition not and: [each definition isClassDefinition not and: [each definition isTraitDefinition not]])
						ifTrue: [removedOthers at: each definition description put: each definition]].
		each isAddition ifTrue: [newDefinitions add: each definition].
		each isModification ifTrue: [newDefinitions add: each modification]].
	"If class traits are modified, there is both an addition and a removal for them, instead of a modification."
	(newDefinitions select: [:each | each isTraitDefinition and: [each isClassDefinition not]])
		do: [:each |
			classTraits at: each baseTrait put: each.
			removedClassTraits removeKey: each baseTrait ifAbsent: []].
	"Add missing class definitions or the cypress writer will treat methods as extensions. Also, to remove or change class traits definitions, the base trait must be written out."
	classifierDefinitions := (newDefinitions select: [:each | each isClassDefinition "also covers baseTraits, but not classTraits (no problem)"]) collect: [:each | each className -> each] as: Dictionary.
	allClassifiers := classifierDefinitions copy.
	aSquotArtifactDiff content startDiff working definitions do:
		[:each | (each isClassDefinition and: [(removedClassifiers includesKey: each description) not])
			ifTrue: [allClassifiers at: each className ifAbsentPut: [each]].
		(each isTraitDefinition and: [each isClassDefinition not])
			ifTrue: [classTraits at: each baseTrait ifAbsentPut: [each]]].
	missingClassifiers := ((((newDefinitions select: [:each | (each isMethodDefinition and: [(classifierDefinitions includesKey: each className) not]) or: [each summary endsWith: ' classTrait']]),
			(removedMethods values select: [:each | (classifierDefinitions includesKey: each className) not]),
			(removedClassTraits values select: [:each | (each summary endsWith: ' classTrait') and: [(classifierDefinitions includesKey: each className) not]]))
		collect: [:each | each className] as: Set) asArray
		collect: [:each | allClassifiers at: each ifAbsent: []])
		reject: [:each | each isNil].
	missingClassTraits := OrderedCollection new.
	newDefinitions do:
		[:each | | classTrait |
		(each isTraitDefinition and: [each isClassDefinition "i. e. is a baseTrait"])
			ifTrue:
				[classTrait := classTraits at: each className.
				(newDefinitions includes: classTrait) ifFalse: [missingClassTraits add: classTrait]]].
	(missingClassifiers select: [:each | each isTraitDefinition])
		do: [:each | | classTrait | classTrait := classTraits at: each className ifAbsent: [].
			(classTrait notNil and: [(newDefinitions includes: classTrait) not])
				ifTrue: [missingClassTraits add: classTrait]].
	cypressWriter writeDefinitions: newDefinitions, missingClassifiers, missingClassTraits.
	"Fix up methodProperties.json files (they now only include the methods that were newly written)."
	allMethods := (newDefinitions select: [:each | each isMethodDefinition]) collect: [:each | each description -> each] as: Dictionary.
	aSquotArtifactDiff content startDiff working definitions do:
		[:each | (each isMethodDefinition and: [(removedMethods includesKey: each description) not]) ifTrue: [allMethods at: each description ifAbsentPut: [each]]].
	allMethods := allMethods groupBy: [:each | each className].
	classifierDefinitions asArray, missingClassifiers do:
		[:each |
		cypressWriter writeInDirectoryName: each className, (each isTraitDefinition ifTrue: ['.trait'] ifFalse: ['.class']), cypressWriter fileUtils pathNameDelimiter
			fileName: 'methodProperties'
			extension: cypressWriter propertyFileExtension
			visit: [cypressWriter writeMethodProperties: (allMethods at: each className ifAbsent: [#()])]].
	"Fix up methodProperties.json for class extensions"
	extensions := allMethods keys reject: [:each | allClassifiers includesKey: each].
	extensions do:
		[:each |
		cypressWriter writeInDirectoryName: each, '.extension', cypressWriter fileUtils pathNameDelimiter asString
			fileName: 'methodProperties'
			extension: cypressWriter propertyFileExtension
			visit: [cypressWriter writeMethodProperties: (allMethods at: each)]].
	"Delete removed items"
	definitions := allMethods values concatenation, allClassifiers values.
	removedOthers, removedMethods, removedClassTraits, removedClassifiers do: [:each | self delete: each].
	"Delete empty extensions"
	((((removedMethods groupBy: [:each | each className]) keys
		copyWithoutAll: allMethods keys) "to preserve still existing extensions"
		copyWithoutAll: allClassifiers keys) "to preserve classes (not extensions) without methods"
		copyWithoutAll: (removedClassifiers collect: [:each | each className] as: Array)) "these are not extensions"
		do: [:each | self deleteExtension: each].