public-configuration
configUnsetAt: aNameString
	| file currentSection delete inDeleteSection lines unsetParts |
	file := self configFile.
	lines := file readStreamDo: [:stream | stream contents lines asOrderedCollection].
	unsetParts := aNameString splitBy: '.'.
	delete := OrderedCollection new.
	currentSection := {}.
	inDeleteSection := false.
	lines withIndexDo: [:line :index |
		line withBlanksTrimmed ifNotEmpty:
			[(line withBlanksTrimmed first == $[) ifTrue:
				[currentSection := self configPartsFromSectionLabel: line withBlanksTrimmed allButFirst allButLast.
				inDeleteSection := currentSection beginsWith: unsetParts].
			inDeleteSection
				ifTrue: [delete add: index]
				ifFalse: [(line withBlanksTrimmed first ~~ $[
						and: [currentSection, {(line copyUpTo: $=) withBlanksTrimmed} = unsetParts])
						ifTrue: [delete add: index]]]].
	delete reverseDo: [:each | lines removeAt: each].
	file writeStreamDo: [:stream |
		lines do: [:each | stream nextPutAll: each; lf].
		stream truncate].