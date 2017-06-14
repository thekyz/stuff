function svnroot
	svn info . | grep -F "Working Copy Root Path:" | cut -f 2 -d ":" | tr -d '[:space:]'
end
