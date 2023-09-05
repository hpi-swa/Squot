accessing
flatChildrenSorted
	^ self flatChildren sorted: [:a :b | a name <= b name]