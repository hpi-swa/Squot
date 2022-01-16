*Squot-Tools
asSquotHierarchicalDiff
	| metadataNodes hiddenProperties |
	self hasChanges ifFalse: [^ #()].
	hiddenProperties := #(objectsReplacedByNames). "These properties are implementation details and changes to them should not be prevented by users."
	metadataNodes := OrderedCollection new.
	containerConflicts do:
		[:each | metadataNodes add:
			(SquotMergeDiffNode title: 'Set ', each key asDiffTreeStringOrText, ' to ', each incoming
				content: each children: #()
				onInclude: [each chooseIncoming]
				onExclude: [each chooseWorking]
				onReset: [each resetChoice])].
	containerModifications keysAndValuesDo:
		[:path :each | metadataNodes add:
			((each isAddition or: [each isModification]) 
				ifTrue: [SquotDiffNode title: 'Set ', each reference asDiffTreeStringOrText, ' to ', each rightTarget
					content: nil children: #()
					onInclude: [containerModifications at: path put: each]
					onExclude: [containerModifications removeKey: path]]
				ifFalse: [SquotDiffNode title: 'Remove ', each reference asDiffTreeStringOrText
					content: nil children: #()
					onInclude: [containerModifications at: path put: each]
					onExclude: [containerModifications removeKey: path]])].
	^ {SquotMergeDiffNode 
		title: '[', 'Metadata' translated, ']'
		content: self
		children: metadataNodes
		onInclude: []
		onExclude: []
		onReset: []}