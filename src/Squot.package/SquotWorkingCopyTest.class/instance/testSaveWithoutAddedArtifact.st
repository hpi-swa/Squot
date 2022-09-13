tests
testSaveWithoutAddedArtifact
	| save |
	"Given"
	workingCopy add: ValueHolder new at: 'object1';
		saveVersionWithMessage: 'Add object1';
		add: ValueHolder new at: 'object2'.
	(workingCopy objectAt: 'object1') contents: #newContents.
	"When"
	save := workingCopy newSaveOperation.
	save message: 'Update object1';
		withUnitOfWork:
			[| patchBuilder |
			patchBuilder := save computePatch createNewBuilder.
			patchBuilder resetAt: 'object2';
				newLoadOrder: (patchBuilder newLoadOrder copyWithout: 'object2').
			save patch: patchBuilder buildPatch.
			save applyToWorkingCopy].
	"Then"
	repository withUnitOfWork:
		[self deny: (workingCopy baseVersion includesObjectAt: 'object2');
			deny: (workingCopy baseVersion loadOrder includes: 'object2');
			assert: (workingCopy includesObjectAt: 'object2');
			assert: (workingCopy loadOrder includes: 'object2');
			assert: (workingCopy baseVersion includesObjectAt: 'object1');
			assert: (workingCopy baseVersion loadOrder includes: 'object1')].