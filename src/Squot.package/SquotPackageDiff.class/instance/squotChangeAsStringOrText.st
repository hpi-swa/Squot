*Squot-Tools
squotChangeAsStringOrText
	| text crcr |
	text := Text new.
	crcr := String cr, String cr.
	patch operations do: [:each |
		text append: each squotChangeAsStringOrText]
		separatedBy: [text append: crcr].
	^ text