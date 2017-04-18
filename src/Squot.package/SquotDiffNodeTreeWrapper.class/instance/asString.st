accessing
asString
	| unembellishedString |
	unembellishedString := super asString.
	item isActive ifTrue: [^ unembellishedString].
	^ '( ', unembellishedString, ' )'