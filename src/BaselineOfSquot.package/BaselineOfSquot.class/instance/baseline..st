baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec baseline: 'Ston' with: [
				spec
					repository: 'github://squeak-smalltalk/squeak-ston:squeak/repository'. ].
		spec baseline: 'FileTree' with: [
				spec
					repository: 'github://dalehenrich/filetree:squeak4.3/repository'. ].
		spec baseline: 'Tonel'
			with: [spec 	repository: 'github://squeak-smalltalk/squeak-tonel:squeak/'].
		spec 
			package: 'SqueakSSL-Core' with: [
				spec
					repository: 'http://source.squeak.org/trunk'. ];
			package: 'WebClient-Core' with: [
				spec
					repository: 'http://source.squeak.org/trunk';
					file: 'WebClient-Core-jr.104'. ];
			package: 'WebClient-HTTP' with: [
				spec
					repository: 'http://source.squeak.org/trunk';
					file: 'WebClient-HTTP-cmm.6'. ];
			package: 'INIFile' with: [
				spec
					repository: 'http://www.squeaksource.com/INIFile';
					file: 'INIFile-jf.3'. ];
			package: 'DiffMerge' with: [
				spec
					repository: 'http://www.squeaksource.com/DiffMerge';
					file: 'DiffMerge-tonyg.12'. ];
			baseline: 'FileSystem' with:
				[spec
					repository: 'github://squeak-smalltalk/squeak-filesystem:master/src';
					loads: #('default' 'tests')];
			package: 'VersionControl';
			package: 'Squot' with: [
				spec requires: #('FileSystem' 'Ston' 'DiffMerge' 'VersionControl' ). ];
			package: 'FileSystem-Git' with: [
				spec requires: #('FileSystem' 'INIFile' 'VersionControl' ). ];
			package: 'Squit' with: [
				spec requires: #('FileSystem-Git' 'Squot'). ];
			package: 'SquotTonel-Core' with:
				[spec requires: #('Squot' 'FileSystem' 'Tonel')];
			package: 'SquotTonel-Tests' with:
				[spec requires: #('SquotTonel-Core')].
		spec 
			group: 'FileSystemGit' with: #('FileSystem-Git' );
			group: 'default' with: #('Squit' 'Squot' 'SquotTonel-Core');
			group: 'tests' with: #('default' 'SquotTonel-Tests'). ].
	
	spec for: #pharo do: [
		spec package: 'SquotCompatibility-Pharo'.
		spec package: 'Squot' with: [
			spec includes: 'SquotCompatibility-Pharo']].
	
	spec for: #'squeakCommon' do: [
		spec package: 'SquotCompatibility-SqueakCommon'.
		spec package: 'Squot' with: [
			spec includes: 'SquotCompatibility-SqueakCommon']].
	
	spec for: #'squeak5.x' do: [
		spec package: 'SquotCompatibility-Squeak50'.
		spec package: 'Squot' with: [
			spec includes: 'SquotCompatibility-Squeak50']].
	
	spec for: #'squeak6.x' do: [
		spec package: 'SquotCompatibility-Squeak60'.
		spec package: 'Squot' with: [
			spec includes: 'SquotCompatibility-Squeak60']].