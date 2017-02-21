exceptiondescription
defaultAction
	| name |
	name := GitStamp requestName.
	GitStamp defaultName: name.
	^ name