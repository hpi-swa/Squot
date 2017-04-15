ui menus
changedArtifactsMenuHook: aMenu shifted: aBoolean
	<changedArtifactsListMenu>
	| selectedArtifact selectionState originalOfSelected |
	(self selection isKindOf: SquotDiffNode) ifTrue: [
		^ self changedSquotDiffNodeMenuHook: aMenu shifted: aBoolean].
	selectionState := self stateOf: (selectedArtifact := self selection first ifNil: [^ aMenu]).
	aMenu addList: (Array streamContents: [:stream |
		selectionState == #ignored ifTrue: [
			stream nextPut: #('unignore' #toggleIgnoreForSelected 'do no longer ignore this change')].
		(#(original ignored) includes: selectionState) ifFalse: [
			stream nextPut: #('do not include this change' #toggleFullInclusionForSelected 'do not include this change in the result')].
		selectionState == #original ifTrue: [
			stream nextPut: #('include this change' #toggleFullInclusionForSelected 'include this change in the result')].
		selectionState ~~ #ignored ifTrue: [
			stream nextPut: #('edit what is included here' #editSelected 'open another dialog to select in more detail, which changes are included with this artifact')].
		selectionState ~~ #ignored ifTrue: [
			stream nextPut: #('ignore' #toggleIgnoreForSelected 'ignore this change from now on')]]).
	aMenu add: 'inspect included edition' target: selectedArtifact selector: #inspect.
	selectionState ~~ #proposed ifTrue: [
		aMenu add: 'inspect proposed edition' target: (self proposedOf: selectedArtifact) selector: #inspect].
	(selectionState ~~ #original and: [(originalOfSelected := self originalOf: selectedArtifact) notNil]) ifTrue: [
		aMenu add: 'inspect original edition' target: originalOfSelected selector: #inspect].
	^ aMenu