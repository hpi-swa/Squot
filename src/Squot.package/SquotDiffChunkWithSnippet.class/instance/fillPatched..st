copying
fillPatched: aSequenceableCollection
	aSequenceableCollection
		replaceFrom: chunk value offset
		to: chunk value offset + chunk value length - 1
		with: snippet value.