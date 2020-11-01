*Squot-Tools
squotChangeAsStringOrText
	| text |
	text := WriteStream on: (Text new: 30).
	containerConflicts ifNotEmpty:
		[text nextPutAll: ('Conflicts:
	
' asText addAttribute: TextEmphasis italic).
		containerConflicts do: [:each | text nextPutAll: each squotChangeAsStringOrText; cr]].
	containerModifications ifNotEmpty:
		[text nextPutAll: ('Modifications:

' asText addAttribute: TextEmphasis italic).
		containerModifications do: [:each | text nextPutAll: each squotChangeAsStringOrText; cr]].
	elementMerges ifNotEmpty:
		[text nextPutAll: ('Merges:

' asText addAttribute: TextEmphasis italic).
		elementMerges do: [:each | text nextPutAll: each squotChangeAsStringOrText; cr]].
	^ text contents