accessing
flatChildrenSorted
	^ self flatChildren sorted: [:a :b | a label <= b label]