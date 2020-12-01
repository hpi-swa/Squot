tests
testGrouping
	| instanceMethod classMethod classDefinition trait classTrait traitMethod classTraitMethod |
	instanceMethod := MCMethodDefinition
		className: 'SampleClass'
		classIsMeta: false
		selector: 'instanceMethod'
		category: 'accessing'
		timeStamp: ''
		source: 'instanceMethod'.
	classMethod := MCMethodDefinition
		className: 'SampleClass'
		classIsMeta: true
		selector: 'classMethod'
		category: 'accessing'
		timeStamp: ''
		source: 'classMethod'.
	classDefinition := MCClassDefinition
		name: 'SampleClass'
		superclassName: 'Object'
		category: 'CategoryForTestToBeDeleted' 
		instVarNames: ''
		comment: ''.
	trait := MCTraitDefinition name: 'SampleTrait' traitComposition: '' category: 'CategoryForTestToBeDeleted' comment: '' commentStamp: nil.
	classTrait := MCClassTraitDefinition baseTraitName: 'SampleTrait' classTraitComposition: ''.
	traitMethod := MCMethodDefinition
		className: 'SampleTrait'
		classIsMeta: false
		selector: 'instanceMethod'
		category: 'accessing'
		timeStamp: ''
		source: 'instanceMethod'.
	classTraitMethod := MCMethodDefinition
		className: 'SampleTrait'
		classIsMeta: true
		selector: 'instanceMethod'
		category: 'accessing'
		timeStamp: ''
		source: 'instanceMethod'.
	self assert: instanceMethod squotGroup = classDefinition squotGroup;
		assert: classMethod squotGroup = 'SampleClass class';
		assert: traitMethod squotGroup = trait squotGroup;
		"Problem with classTraitMethod: classTrait would have to be loaded to make this succeed:
		assert: classTraitMethod squotGroup = classTrait squotGroup;"
		assert: ((classTraitMethod squotGroup endsWith: ' classSide') or: [classTraitMethod squotGroup endsWith: ' class']);
		assert: (classTrait squotGroup endsWith: ' classSide').