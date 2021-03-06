# Sage Bionetworks CommonCompute Environment

## Build

1. [Fork](http://help.github.com/fork-a-repo/) and clone this repository to your machine.
2. Install [packer](http://www.packer.io/docs/installation.html).
3. Change to the root of the repository you cloned, and run:
   ```
   packer build config.json
   ```

**The installation requires a larger disk than is provided by the default AMIs. A custom AMI with > 100GB is required.**

Amazon AWS credentials are required to be set as environment variables for `AWS_ACCESS_KEY` and `AWS_SECRET_KEY`.

If the build fails because an AMI cannot be found, check that source AMI is current, look here: https://github.com/awslabs/cfncluster/blob/master/amis.txt and update the `builders` section `source_ami` in [config.json](config.json).

## CfnCluster

This uses cfncluster to launch. See https://sagebionetworks.jira.com/wiki/display/COMCOMP/CommonCompute for info on how to do this.

## Contribute

To contribute, [fork](http://help.github.com/fork-a-repo/) the [main repo](https://github.com/Sage-Bionetworks/CommonCompute), branch off a [feature branch](https://www.google.com/search?q=git+feature+branches) from `master`, make your changes and [commit](http://git-scm.com/docs/git-commit) them, [push](http://git-scm.com/docs/git-push) to your fork and submit a [pull request](http://help.github.com/send-pull-requests/) for `Sage-Bionetworks/CommonCompute:master`.
