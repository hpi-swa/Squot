private
reinsertInLoadOrder: path
	"If an artifact removal was excluded, we must readd it to the patchedLoadOrder. Problem: the order might have been changed at the same time, so it is difficult to tell the correct position."
	| referenceItem lookBeforePath |
	lookBeforePath := path.
	[referenceItem := originalLoadOrder before: lookBeforePath
		ifAbsent: [lookBeforePath = originalLoadOrder first
					ifTrue: [^ patchedLoadOrder addFirst: path]
					ifFalse: [self error: 'Artifact should not be readded, was not in the orignal']].
	patchedLoadOrder includes: referenceItem] whileFalse:
		[lookBeforePath := referenceItem].
	patchedLoadOrder add: path after: referenceItem.