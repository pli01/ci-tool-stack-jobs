SHELL = /bin/bash
JJB_JOBS ?= jobs-deployer
OUTPUT ?= output
JJB_USER ?= admin
JJB_CONFIG = $(shell echo "--conf $$HOME/.config/jenkins_jobs/jenkins_jobs_$(JJB_USER).ini")
JJB_ARGS = --flush-cache
default: update

unit-test:
	( cd tests && make build clean clean-docker-image )
	( cd tests && make clean clean-docker-image )
test: clean
	rm -rf $(OUTPUT) ||true 
	mkdir -p $(OUTPUT)
	jenkins-jobs test -o $(OUTPUT)/$(JJB_JOBS) $(JJB_JOBS)

update: test
	jenkins-jobs $(JJB_CONFIG) $(JJB_ARGS) update $(JJB_JOBS)

clean:
	-if [ -d "$(OUTPUT)/$(JJB_JOBS)" ] ; then rm -rf $(OUTPUT)/$(JJB_JOBS) ; fi

