tests
testAdditionalParentsWhenSavedNonInteractivelyOld
	| text firstVersion secondVersion thirdVersion |
	"given"
	[firstVersion := workingCopy
		add: (text := Text fromString: 'example') at: 'some-text';
		saveVersionWithMessage: 'first version']
		on: Deprecation do: [:e | e resume].
	text append: ' 1'.
	[secondVersion := workingCopy saveVersionWithMessage: 'append 1']
		on: Deprecation do: [:e | e resume].
	workingCopy loadVersion: firstVersion interactive: false.
	self assert: 'example' equals: text string.
	"when"
	workingCopy addParentVersion: secondVersion.
	text append: ' 2'.
	[thirdVersion := workingCopy saveVersionWithMessage: 'append 2']
		on: Deprecation do: [:e | e resume].
	"then"
	self assert: thirdVersion parents size = 2.
	self assert: thirdVersion parents asSet = (Set with: firstVersion with: secondVersion).