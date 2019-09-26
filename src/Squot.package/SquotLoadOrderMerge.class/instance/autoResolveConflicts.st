private
autoResolveConflicts
	"Resolves conflicts by first using all elements of the working copy and then appending 
	the elements in the incoming container, ensuring that each one gets added only once."
	| leftSet paths |
	leftSet := working asSet.
	paths := OrderedCollection new.
	diff3merge do:
		[:each |
		each key == #conflict
			ifTrue:
				[ | added |
				added := OrderedCollection new.
				paths addAll: (added addAll: (each value left copyWithoutAll: paths));
					addAll: (added addAll: (each value right copyWithoutAll: paths)).
				self resolveConflict: each with: [added]]
			ifFalse: [paths addAll: each value]].
	^ GenericDiff squotDiffClass new
		file1: working;
		file2: paths;
		diff