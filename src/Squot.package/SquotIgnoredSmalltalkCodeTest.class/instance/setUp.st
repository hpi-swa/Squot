running
setUp
	classFactory := ClassFactoryForTestCase new.
	sampleClass := classFactory newClass.
	sampleMethod := sampleClass compileSilently: 'a ^ #a' classified: #accessing.