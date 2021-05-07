tests
testAdditionalParentsWhenSavedNonInteractivelyOld
	| text firstVersion secondVersion thirdVersion |
	"given"
	[firstVersion := workingCopy
		add: (text := ValueHolder new contents: 'example') at: 'some-text';
		saveVersionWithMessage: 'first version']
		on: Deprecation do: [:e | e resume].
	text contents: text contents, ' 1'.
	[secondVersion := workingCopy saveVersionWithMessage: 'append 1']
		on: Deprecation do: [:e | e resume].
	workingCopy loadVersion: firstVersion interactive: false.
	self assert: 'example' equals: text contents.
	"when"
	workingCopy addParentVersion: secondVersion.
	text contents: text contents, ' 2'.
	[thirdVersion := workingCopy saveVersionWithMessage: 'append 2']
		on: Deprecation do: [:e | e resume].
	"then"
	self assert: thirdVersion parents size = 2.
	self assert: thirdVersion parents asSet = (Set with: firstVersion with: secondVersion).