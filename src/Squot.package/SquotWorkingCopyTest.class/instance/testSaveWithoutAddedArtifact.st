tests
testSaveWithoutAddedArtifact
	| object1 object2 object1Id object2Id save |
	"Given"
	workingCopy add: (object1 := ValueHolder new) at: 'object1';
		saveVersionWithMessage: 'Add object1';
		add: (object2 := ValueHolder new) at: 'object2'.
	object1Id := workingCopy idOfObject: object1.
	object2Id := workingCopy idOfObject: object2.
	(workingCopy objectAt: 'object1') contents: #newContents.
	"When"
	save := workingCopy newSaveOperation.
	save message: 'Update object1';
		withUnitOfWork:
			[SquotToggles useNewApi
				ifTrue:
					[| merge |
					merge := save computePatch.
					merge removeModificationAt: object2Id.
					save patch: merge]
				ifFalse:
					[| patchBuilder |
					patchBuilder := save computePatch createNewBuilder.
					patchBuilder resetAt: 'object2';
						newLoadOrder: (patchBuilder newLoadOrder copyWithout: 'object2').
					save patch: patchBuilder buildPatch].
			save applyToWorkingCopy].
	"Then"
	repository withUnitOfWork:
		[self deny: (workingCopy baseVersion includesObjectAt: object2Id);
			deny: (workingCopy baseVersion loadOrder includes: object2Id);
			assert: (workingCopy includesObjectAt: object2Id);
			assert: (workingCopy loadOrder includes: 'object2');
			assert: (workingCopy baseVersion includesObjectAt: object1Id);
			assert: (workingCopy baseVersion loadOrder includes: object1Id)].