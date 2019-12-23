*Squot-Tools
squotChangeAsStringOrText
	| text crcr |
	text := Text new.
	crcr := String cr, String cr.
	containerConflicts
		do: [:each | text append: each squotChangeAsStringOrText]
		separatedBy: [text append: crcr].
	containerModifications
		do: [:each | text append: each squotChangeAsStringOrText]
		separatedBy: [text append: crcr].
	^ text