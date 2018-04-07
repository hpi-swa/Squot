running
setUp
	classFactory2 := SquotClassFactoryForTestCase new
		packageName: (classFactory packageName, '-2') asSymbol.
	self createFirstMergeParent;
		createSecondMergeParent.