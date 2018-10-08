# Deploying Microservices to Employment Tribunals Production
**v1.0 08/10/2018**

## Overview

This document walks through the deployment process for ET microservices.

Each microservice within ET has its own version number, it is not controlled centrally via the full-system.

We use release branches due to limitations enforced upon us by template-deploy, whereby develop branches would lead to development freezes.
Using release branches means we can continue to create feature branches and merge them into develop without causing issues with ongoing releases.

## Prepare Each Microservice

_Assuming that the features that form the release have been merged into `develop` from their `feature` branch._

**These steps must be repeated for each microservice within ET**

1. Branch off of `develop` to create a `release/xxx` branch. **Naming convention for release branches TBD**
1. On Github, do a comparison of the `release` branch against `master`
1. Go to the Github Releases page and `Draft a New Release`
    2. We use [Semantic Versioning](https://semver.org/) for the `tag version`, add `-rc1` (`Release Candidate 1`) at this stage
    2. Target the `release` branch that has been created for this deployment
    2. Use the tag name as the release title
    2. Release notes should be split into `New`, `Fix`, `Change` & `Security`.
    2. Using the comparison of the `release` branch against `master` (step 2), make a bullet point for each change under the correct heading
    2. Each bullet point should have a Jira ticket number and link to the PR from `feature` to `develop`
    2. Tick `This is a pre-release` and publish the release
1. In Jenkins, run a `BUILD` job on the `release` branch (NB: Before using Jenkins please liaise with colleagues)
1. `DEPLOY` the build to `dev` and `staging`
1. Inform QA - await sign-off or hotfix as appropriate (see [Hotfixing a Release Candidate](#hotfixing-a-release-candidate))

## Prepare Full System

1. Branch off of `develop` to create a `release/xxx` branch. **Naming convention for release branches TBD**
1. Update [RELEASES.md](../RELEASES.md) at the top of the document using the following format:
    ```markdown
       # Microservice vx.x.x & Other Microservice vx.x.x
       **Date of Deployment**
       
       ## New
       
       * Microservice - Non-technical one-liner of change. (Jira Ticket)
       * (Example) Admin - Admins and Super Users can now manage other users via the admin portal (RST-1314)
       
       ## Changes
       
       _No new features_
       
       ## Fixes
       
       _No new features_
    
       ## Security
        
        _No new features_
       
       ## Info
       Deployed by <who?>
       
       Downtime information - No downtime expected
       
       Risk information - This release may require some users to reset their password
    ```
    **NB: The release notes in this file are for stakeholder use and should be kept layman-friendly**
1. Go through each service submodule in full-system and ensure they point to the commit SHA in the `release` branch of the microservice
1. Push to Github and await stakeholder approval based upon the release notes

## Deploy to Production

**These steps are only to be followed once QA and stakeholders approve the release**

1. In Jenkins, `DEPLOY` the approved build to prod
1. For each microservice, via Github
    2. Set up a PR from `release` branch into `master` - Retain the last five `release` branches
    2. Edit the Release information, removing the `-rc` suffix and untick `This is a pre-release`
1. On the `release` branch of full-system, update [RELEASES.md](../RELEASES.md) as a record of how the deployment went
1. Using the microservice ping.json files, ensure the SHAs between full-system and production match
1. PR full-system `release` branch into `develop` & `master` - Retain the last five `release` branches

## Hotfixing a Release Candidate

If an issue is found in a release candidate, fix using a `hotfix/xxx` branch in the relevant microservice.
1. Once the PR is approved, merge the fix directly into the `release` branch, do not merge into `develop`
1. Update the Github release version tag data (increment the `-rc` by one)
1. Where applicable, update the Github release notes
1. Update the full-system `release` branch to point to the service `release` branch hotfix SHA
1. Where applicable, update [RELEASES.md](../RELEASES.md)
1. `BUILD` and `DEPLOY` the hotfixed `release` branch to dev and staging (NB: Before using Jenkins please liaise with colleagues)
1. Inform QA & stakeholders, await approval for deployment or follow these steps again if there are continued issues

## To Do

- [ ] Confirm microservice release branch naming convention as `release/v.x.x.x`
- [ ] Decide upon a naming convention for full-system release branches