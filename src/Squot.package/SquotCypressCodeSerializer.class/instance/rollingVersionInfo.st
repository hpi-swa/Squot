private
rollingVersionInfo

	"This allows users to easily update Squot projects that are installed using Metacello.
If the version of the project the user requests to install is not higher than the currently installed version, Metacello will not install the newly requested version.
	As git projects usually don't have incrementing version numbers, using the seconds since unix time is a good enough workaround, as it simply generates an ever-increasing version number."
	^MCVersionInfo
	    name: self packageNameFromPackageDirectory , '-squot.', DateAndTime totalSeconds asString
	    id: UUID new
	    message: 'created from a Squot Artifact.'
	    date: Date today
	    time: Time now
	    author: Utilities authorInitials
	    ancestors: #()
	    stepChildren: #()