running
setUp
	| tempClass name |
	classFactory := ClassFactoryForTestCase new.
	tempClass := classFactory newClass.
	name := tempClass name.
	classFactory delete: tempClass.
	sampleTrait := Trait named: name uses: #() category: classFactory defaultCategory.
	classFactory createdClasses add: sampleTrait.
	sampleMethod := sampleTrait compileSilently: 'a ^ #a' classified: #accessing.
	sampleClassTraitMethod := sampleTrait classTrait compileSilently: 'b ^ #b' classified: #accessing.