copying
fillOriginal: aSequenceableCollection
	aSequenceableCollection
		replaceFrom: chunk key offset
		to: chunk key offset + chunk key length - 1
		with: snippet key.