objects-private
errorObjectNotFound: aHash
	^ GitObjectNotFoundError 
		signal: aHash printString, ' not found'
		with: aHash