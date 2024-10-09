accessing
contents
	^ self item children collect: [:each | self class with: each model: self model]