as yet unclassified
baseline: spec
	<baseline>
	spec for: #common do: [
		spec 
			baseline: 'Squot' with: [spec repository: 'github://hpi-swa/Squot:master/src'];
			package: 'LBGit-Core' with: [spec requires: #('Squot')];
			package: 'LBGit-Extensions' with: [spec requires: #('LBGit-Core')];
			package: 'LBGit-Tests' with: [spec requires: #('LBGit-Core' 'LBGit-Extensions')];
			group: 'default' with: #('LBGit-Core' 'LBGit-Extensions');
			group: 'tests' with: #('LBGit-Tests');
			postLoadDoIt: #postLoad
		].