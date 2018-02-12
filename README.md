# ci-tool-stack-jobs
This repository contains sample seed jenkins jobs, using jenkins-job-builder (jjb)

* job-builder-seed-job: the first seed job, will generate others jobs, defined in a builders list in job-builder-seed-job/seed.yml.
  * on first execution, all other jobs will be generated : update-jobs-deployer

* job-hello-world-1: one sample hello world using jjb style
* job-hello-world-2: another sample hello world using jjb style importing dsl job

* Makefile: the executor of jenkins-jobs with option (conf, update, test)
  * JJB_JOBS="job_dir"
  * JJB_CONFIG="--config rep/file/jenkins_jobs.ini"
  * JJB_USER="user"
  * OUTPUT=output : generate test output dir

Usage:
```
make test JJB_JOBS="job_dir"
make update
```
* tests
