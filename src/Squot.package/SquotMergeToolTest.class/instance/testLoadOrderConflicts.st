tests
testLoadOrderConflicts
	| addedWorking addedIncoming addedBoth addedBothConflict
	removedWorking removedIncoming removedBoth
	movedWorking movedIncoming movedWithConflict
	unchanged modifiedInSamePosition 
	working incoming base labels merge |
	working := SquotImageStore new
		"First come the objects moved by one side (except for the conflicting move, which goes up in the working copy and down in the other version)."
		add: (movedWithConflict := ValueHolder new contents: 'moved-conflict') at: 'moved-conflict';
		add: (movedWorking := ValueHolder new contents: 'moved-working') at: 'moved-working';
		"The unchanged object is the fix point, followed by the modified object whose position did not change."
		add: (unchanged := ValueHolder new contents: 'unchanged') at: 'unchanged';
		add: (modifiedInSamePosition := ValueHolder new contents: 'modified-same-position') at: 'modified-same-position';
		"Then come the objects moved in the other version."
		add: (movedIncoming := ValueHolder new contents: 'moved-incoming') at: 'moved-incoming';
		"Last but not least follow the removals, then the additions, in both cases first the common changes, than the side-specific ones."
		add: (removedIncoming := ValueHolder new contents: 'removed-incoming') at: 'removed-incoming';
		add: (addedBoth := ValueHolder new contents: 'added-both') at: 'added-both';
		add: (addedBothConflict := ValueHolder new contents: 'added-both-conflict') at: 'added-both-conflict';
		add: (addedWorking := Object new) at: 'added-working';
		captureSnapshot "to initialize the registry";
		yourself.
	incoming := working copy "for the object registry" removeAllObjects;
		add: movedIncoming at: (working pathsOf: movedIncoming) anyOne;
		add: unchanged at: (working pathsOf: unchanged) anyOne;
		add: modifiedInSamePosition at: (working pathsOf: modifiedInSamePosition) anyOne;
		add: movedWorking at: (working pathsOf: movedWorking) anyOne;
		add: (removedWorking := ValueHolder new contents: 'removed-working') at: 'removed-working';
		"In the incoming version, the addition position conflict is before the common addition."
		add: addedBothConflict copy "no conflict in the contents" at: (working pathsOf: addedBothConflict) anyOne;
		add: addedBoth copy at: (working pathsOf: addedBoth) anyOne;
		add: (addedIncoming := Object new) at: 'added-incoming';
		"In the incoming version, the conflicting move goes to the bottom, not to the top."
		add: movedWithConflict at: (working pathsOf: movedWithConflict) anyOne;
		yourself.
	base := incoming copy "for the object registry" removeAllObjects;
		add: unchanged at: (working pathsOf: unchanged) anyOne;
		add: modifiedInSamePosition at: (working pathsOf: modifiedInSamePosition) anyOne;
		add: movedWithConflict at: (working pathsOf: movedWithConflict) anyOne;
		add: movedWorking at: (working pathsOf: movedWorking) anyOne;
		add: movedIncoming at: (working pathsOf: movedIncoming) anyOne;
		add: (removedBoth := Object new) at: 'removed-both';
		add: removedWorking at: (incoming pathsOf: removedWorking) anyOne;
		add: removedIncoming at: (working pathsOf: removedIncoming) anyOne;
		captureSnapshot;
		yourself.
	merge := SquotMerge into: working
		merge: ([| original |
			original := modifiedInSamePosition contents.
			[modifiedInSamePosition contents: 'CHANGED'.
			incoming captureSnapshot]
				ensure: [modifiedInSamePosition contents: original]] value)
		basedOn: base captureSnapshot.
	self openToolAndTestOn: merge.
	labels := tool rootNodes collect: [:each | tool nodeLabelOf: each].
	self assert: (labels anySatisfy: [:each | each includesSubstring: (incoming pathsOf: addedIncoming) anyOne]);
		assert: (labels anySatisfy: [:each | each includesSubstring: (working pathsOf: addedBoth) anyOne]);
		assert: (labels anySatisfy: [:each | each includesSubstring: (working pathsOf: addedBothConflict) anyOne]);
		assert: (labels anySatisfy: [:each | each includesSubstring: (working pathsOf: removedIncoming) anyOne]);
		assert: (labels anySatisfy: [:each | each includesSubstring: (working pathsOf: modifiedInSamePosition) anyOne]);
		assert: (labels anySatisfy: [:each | each includesSubstring: 'load order']).