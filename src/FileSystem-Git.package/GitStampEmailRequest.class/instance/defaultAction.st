exceptiondescription
defaultAction
	| mail |
	mail := GitStamp requestEmail.
	GitStamp defaultEmail: mail.
	^ mail