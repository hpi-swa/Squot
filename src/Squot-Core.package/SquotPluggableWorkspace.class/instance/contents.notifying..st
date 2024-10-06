accessing
contents: aString notifying: pluggableTextMorphPlus
	| success |
	success := self onSave cull: aString cull: pluggableTextMorphPlus textMorph editor.
	success ifTrue: [self contents: aString].