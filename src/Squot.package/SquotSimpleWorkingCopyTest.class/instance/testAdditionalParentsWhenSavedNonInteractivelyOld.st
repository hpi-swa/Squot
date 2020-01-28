tests
testAdditionalParentsWhenSavedNonInteractivelyOld
	| text firstVersion secondVersion thirdVersion |
	"given"
	[firstVersion := workingCopy
		add: (text := Text fromString: 'example') at: 'some-text';
		saveNewVersionMessage: 'first version' interactive: false]
		on: Deprecation do: [:e | e resume].
	text append: ' 1'.
	[secondVersion := workingCopy saveNewVersionMessage: 'append 1' interactive: false]
		on: Deprecation do: [:e | e resume].
	workingCopy loadVersion: firstVersion interactive: false.
	self assert: 'example' equals: text string.
	"when"
	workingCopy addParentVersion: secondVersion.
	text append: ' 2'.
	[thirdVersion := workingCopy saveNewVersionMessage: 'append 2' interactive: false]
		on: Deprecation do: [:e | e resume].
	"then"
	self assert: thirdVersion parents size = 2.
	self assert: thirdVersion parents asSet = (Set with: firstVersion with: secondVersion).