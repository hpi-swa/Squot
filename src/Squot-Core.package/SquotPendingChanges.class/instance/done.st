actions-private
done
	self dialog ifNotNil: #close.
	self promise resolveWith: nil.
	^ self promise