---
layout: post
title: Environtment variables for jenkins when script running
creation-date: 2012-11-19 14:07:07
---
Jenkins is great and useful as a general job scheduler.
In cofiguration pane, you can configure shell script runs and scheduling like cron.
Then you can use some [environment variables][envvars].

[envvars]: https://wiki.jenkins-ci.org/display/JENKINS/Building+a+software+project#Buildingasoftwareproject-JenkinsSetEnvironmentVariables


For example, `$BUILD_NUMBER` provides the number of build and `$WORKSPACE` gives the workspace directory of the job.

```bash
suffix=$BUILD_NUMBER
[[ -z "$BUILD_NUMBER" ]] && suffix=`date +%Y%m%d-%H%M%S`

do_sth() {
  # DO SOMETHING
  echo "..."
}
if ! do_sth; then
  exit 1
fi

cd "$WORKSPACE"
mkdir sth-$suffix
```

If this script runs on a jenkins job, it creates a directory with each build number in the workspace every build,
otherwise it creates a directory with timestamp in $HOME.
And it also sends a notification mail to you if the script is failed.
