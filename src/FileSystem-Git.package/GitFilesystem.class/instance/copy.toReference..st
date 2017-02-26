private
copy: aPath toReference: destRef
	self flag: 'TODO: if copying within a repository, just relink the trees and blobs'.
	^ super copy: aPath toReference: destRef