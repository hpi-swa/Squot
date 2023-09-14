children
children: aCollection
	^ Array streamContents: [:stream |
		self putSpecs: aCollection on: stream]