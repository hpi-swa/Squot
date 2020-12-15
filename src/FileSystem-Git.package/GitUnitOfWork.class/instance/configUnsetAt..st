configuration
configUnsetAt: aNameString
	| file lines unsetParts delete currentSection inDeleteSection |
	file := repository configFile.
	file exists ifFalse: [^ self].
	lines := file readStreamDo: [:stream | stream contents lines asOrderedCollection].
	unsetParts := aNameString splitBy: '.'.
	delete := OrderedCollection new.
	currentSection := {}.
	inDeleteSection := false.
	lines withIndexDo: [:line :index |
		line withBlanksTrimmed ifNotEmpty:
			[(line withBlanksTrimmed first == $[) ifTrue:
				[currentSection := repository configPartsFromSectionLabel: line withBlanksTrimmed allButFirst allButLast.
				inDeleteSection := currentSection beginsWith: unsetParts].
			inDeleteSection
				ifTrue: [delete add: index]
				ifFalse: [(line withBlanksTrimmed first ~~ $[
						and: [currentSection, {(line copyUpTo: $=) withBlanksTrimmed} = unsetParts])
						ifTrue: [delete add: index]]]].
	delete reverseDo: [:each | lines removeAt: each].
	file writeStreamDo: [:stream |
		lines do: [:each | stream nextPutAll: each; lf].
		stream truncate: stream position].
	config := nil. "reload"