running
setUp
	| existingClass |
	preparedWorkingCopy := SquotWorkingCopy forTestInMemory.
	classFactory := ClassFactoryForTestCase new.
	SystemChangeNotifier uniqueInstance doSilently:
		[existingClass := classFactory newClass].
	existingMethod := MethodReference class: existingClass selector: #existing.
	methodToBeRemoved := MethodReference class: existingClass selector: #toBeRemoved.
	methodToBeAdded := MethodReference class: existingClass selector: #toBeAdded.
	existingClass compileSilently: existingMethod selector. "empty method"
	existingClass compileSilently: methodToBeRemoved selector. "empty method"
	preparedWorkingCopy add: existingClass packageInfo at: self packagePath.
	self suppressProgressDisplayDuring: [preparedWorkingCopy saveVersionWithMessage: 'init'].
	existingClass removeSelectorSilently: methodToBeRemoved selector.
	existingClass compileSilently: methodToBeAdded selector. "empty method"
	existingClass compileSilently: existingMethod selector, ' ^ #changed'.
	existingClass addInstVarName: 'addedVariable'. "change class definition"