# The name of the package under test
PACKAGE_NAME=kernel

# The toplevel namespace within which the test lives.
TOPLEVEL_NAMESPACE=/$(PACKAGE_NAME)

# The version of the test rpm that gets
#  created / submitted
export TESTVERSION=1.0

# The path of the test below the package
RELATIVE_PATH=container/docker

# Name of the tgz file that will be bundled in the rpm
TARGET=docker-$(TESTVERSION)

# The relative path name to the test
export TEST=$(TOPLEVEL_NAMESPACE)/$(RELATIVE_PATH)

# All files you want bundled into your rpm
FILES=$(METADATA) runtest.sh

clean:
	rm -f *~ $(METADATA)

run:
	@echo "No Build required using version packaged in distro"
	chmod +x ./runtest.sh
	./runtest.sh

# Include a global make rules file
include /usr/share/rhts/lib/rhts-make.include

$(METADATA):
	touch $(METADATA)
	@echo "Name:		$(TEST)"	> $(METADATA)
	@echo "Description:	Docker" >> $(METADATA)
	@echo "Path:		$(TEST_DIR)"	>> $(METADATA)
	@echo "TestTime:	20m"		>> $(METADATA)
	@echo "TestVersion:	$(TESTVERSION)"	>> $(METADATA)
	@echo "Releases:	-RHEL2.1 -RHEL3" >> $(METADATA)
	@echo "Destructive:	no"		>> $(METADATA)
	@echo "Confidential:	no"		>> $(METADATA)
	@echo "Priority:	Normal"		>> $(METADATA)
	@echo "Type:		MajorTest" >> $(METADATA)
	@echo "RunFor:		kernel"		>> $(METADATA)
	@echo "RunFor:		docker"		>> $(METADATA)
	@echo "License:		GPL"		>> $(METADATA)
	@echo "Owner:		Major Hayden <major@mhtx.net>"	>> $(METADATA)
