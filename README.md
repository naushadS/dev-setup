dev-setup
==========

Setting up a new developer machine can be an **ad-hoc, manual, and time-consuming** process.  `dev-setup` aims to **simplify** the process with **easy-to-understand instructions** and **scripts** to **automate the setup** of the following:

* **Developer tools**: git, Node.js, Docker, etc
* **Developer apps**: Google Chrome, Visual Studio Code, Postman, Sky for linux, VLC, Spotify etc
* **Data Science Tools**: Anaconda Distribution etc
* **Common data stores**: Redis, MongoDB etc
* **Big Data platforms**: (...Under Development)
* **Utilities**: xpad, Redshift, Terminator, Vim Editor, Safe Eyes etc
* **Libraries**: thefuck, beautysh etc
* **Miscellaneous**: (...stuff that will fix minor annoyances with ubuntu and make ubuntu great again)
* **Bash Customizations**: Prompt String Customization, Some General Bash Alises etc


### But...I Don't Need All These Tools!

**`dev-setup` is geared to be more of an organized *reference* of various developer tools.**

**You're *not* meant to install everything.**

If you're interested in automation, `dev-setup` provides a customizable [setup script](#single-setup-script).  There's really no one-size-fits-all solution for developers so you're encouraged to make tweaks to suit your needs.

[Credits](#credits): This repo builds on the awesome work from [Donne Martin](https://github.com/donnemartin) who built the similar thing for Mac OS X Environment, the repository of which is [donnemartin/dev-setup](https://github.com/donnemartin/dev-setup).

# Sections Summary
* Section 1 contains the scripts and instructions to set up your system.
* Sections 2 through 11 detail more information about installation, configuration, and usage for topics in Section 1.

## Section 1: Installation

**Scripts tested on Ubuntu 18.04**

* [Single Setup Script](#single-setup-script) <- Click here to jump to installation.
* [devtools.sh script](#devtoolssh-script)
    * Sets up Tools and Programming languages geared towards s/w development- [See List](#section-2-developer-tools)
* [devapps.sh script](#devappssh-script)
    * Sets up Applications which are must for any developer to make Software Developent convenient and enjoyable- [See List](#section-3-developer-apps)
* [datasciencetools.sh](#datasciencetoolssh-script)
    * Sets up tools geared towards Data Science- [See List](#section-4-data-science-tools)
* [datastores.sh script](#datastoressh-script)
    * Sets up common data stores- [See List](#section-5-data-stores)
* [utils.sh script](#utilssh-script)
    * Sets up must-have utilities- [See List](#section-7-utilities)
* [libraries.sh script](#librariessh-script)
    * Sets up some essential libraries- [See List](#section-8-libraries)
* [miscellaneous.sh script](#miscellaneoussh-script)
    * Sets up Tweaks and Themes- [See List](#section-9-miscellaneous)
* [bashcustomizations.sh script](#bashcustomizationssh-script)
    * Sets up some cool bash customizations- [See List](#section-10-bash-customizations)

## Section 2: Developer Tools

* [Git](#git)
* [Node.js](#node.js)
* [Docker](#docker)

## Section 3: Developer Apps

* [Chrome](#google-chrome)
* [Visual Studio Code](#visual-studio-code)
* [Postman](#postman)
* [Sky for linux ](#sky-for-linux)
* [VLC](#vlc)
* [Spotify](#spotify)

## Section 4: Data Science Tools

* [Anaconda Distribution](#anaconda-distribution)

## Section 5: Data Stores

* [Redis](#redis)
* [MongoDB](#mongodb)

## Section 6: Big Data Platforms, AWS

***This section is under development.***

## Section 7: Utilities

* [xpad](#xpad)
* [Redshift](#redshift)

## Section 8: Libraries

* [thefuck](#thefuck)
* [beautysh](#beautysh)

## Section 9: Miscellaneous

* [Tweaks](#tweaks)

## Section 10: Bash Customizations

* [PromptString](#promptstring)
* [BashAliases](#bashaliases)

## Section 11: Misc

* [Contributions](#contributions)
* [Credits](#credits)
* [Contact Info](#contact-info)
* [License](#license)

## Section 1: Installation

### Single Setup Script

#### Running with Git

##### Clone the Repo

    $ cd ~ && git clone https://github.com/naushads/dev-setup.git && cd dev-setup

**Since you probably don't want to install every section**, the `main.sh` script supports command line arguments to run only specified sections.  Simply pass in the [scripts](#scripts) that you want to install.  Below are some examples.

**For more customization, you can [clone](#clone-the-repo) or [fork](https://github.com/naushads/dev-setup/fork) the repo and tweak the `main` script and its associated components to suit your needs.**

Run all:

    $ bash main.sh all

Run `devtools.sh` and `utils.sh`:

    $ bash main.sh devtools utils

#### Running without Git

    $ cd ~ && mkdir dev-setup && cd dev-setup && curl -#L https://github.com/naushads/dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}
    $ bash main.sh [Add ARGS Here]

#### Scripts

* [main](https://github.com/naushads/dev-setup/blob/master/main.js)
    * Runs specified scripts
* [devtools.sh](https://github.com/naushads/dev-setup/blob/master/devtools.sh)
    * Sets up Tools and Programming languages geared towards s/w development- [See List](#section-2-developer-tools)
* [devapps.sh](https://github.com/naushads/dev-setup/blob/master/devapps.sh)
    * Sets up Applications which are must for any developer to make Software Developent convenient and enjoyable- [See List](#section-3-developer-apps)
* [datasciencetools.sh](https://github.com/naushads/dev-setup/blob/master/datasciencetools.sh)
    * Sets up tools geared towards Data Science- [See List](#section-4-data-science-tools)
* [datastores.sh](https://github.com/naushads/dev-setup/blob/master/datastores.sh)
    * Sets up common data stores- [See List](#section-5-data-stores)
* [utils.sh](https://github.com/naushads/dev-setup/blob/master/utils.sh)
    * Sets up must-have utilities- [See List](#section-7-utilities)
* [libraries.sh](https://github.com/naushads/dev-setup/blob/master/libraries.sh)
    * Sets up some essential libraries- [See List](#section-8-libraries)
* [miscellaneous.sh](https://github.com/naushads/dev-setup/blob/master/miscellaneous.sh)
    * Sets up Tweaks and Themes- [See List](#section-9-miscellaneous)
* [bashcustomizations.sh](https://github.com/naushads/dev-setup/blob/master/bashcustomizations.sh)
    * Sets up some cool bash customizations- [See List](#section-10-bash-customizations)

**Notes:**

* `main.sh` will initially prompt you to enter your password.
* `main.sh` might ask you to re-enter your password at certain stages of the installation.
* If ubuntu(linux) updates require a restart, simply run `main.sh` again to resume where you left off.
* `main.sh` runs `sudo apt-get update` command, which takes a while to complete as some libraries need to be installed before proceeding.
* **When `main.sh` completes, be sure to restart your computer for all updates to take effect.**

### devtools.sh script

To set up developer tools, run the `devtools.sh` script:

    $ ./devtools.sh

### devapps.sh script

To set up developer apps, run the `devapps.sh` script:

    $ ./devapps.sh

### datasciencetools.sh script

To set up developer apps, run the `datasciencetools.sh` script:

    $ ./datasciencetools.sh

### datastores.sh script

To set up common data stores, run the `datastores.sh` script:

    $ ./datastores.sh

### utils.sh script

To set up utilities, run the `utils.sh` script:

    $ ./utils.sh

### libraries.sh script

To set up utilities, run the `libraries.sh` script:

    $ ./libraries.sh

### miscellaneous.sh script

To set up utilities, run the `miscellaneous.sh` script:

    $ ./miscellaneous.sh

### bashcustomizations.sh script

To set up utilities, run the `bashcustomizations.sh` script:

    $ ./bashcustomizations.sh

## Section 2: Developer Tools
### Git

<p align="center">
  <img src="https://git-scm.com/images/logos/downloads/Git-Logo-2Color.png" width="450" height="200">
  <br/>
</p>

[Git](https://git-scm.com/) is a version-control system for tracking changes in computer files and coordinating work on those files among multiple people. It is primarily used for source-code management in software development, but it can be used to keep track of changes in any set of files.

#### Installation

The [devtools.sh script](#devtoolssh-script) installs Git.

### Node.js

<p align="center">
  <img src="https://i0.wp.com/technology.amis.nl/wp-content/uploads/2016/04/my-first-nodejs-service.png" width="450" height="200">
  <br/>
</p>

[Node.js](https://nodejs.org) is an open-source, cross-platform JavaScript run-time environment that executes JavaScript code outside of a browser.

#### Installation

The [devtools.sh script](#devtoolssh-script) installs Node.js.

### Docker

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/docker.png">
  <br/>
</p>

[Docker](https://www.docker.com) automates the deployment of applications inside software containers.  I think the following [quote](http://www.linux.com/news/enterprise/cloud-computing/731454-docker-a-shipping-container-for-linux-code) explains docker nicely: "Docker is a tool that can package an application and its dependencies in a virtual container that can run on any Linux server. This helps enable flexibility and portability on where the application can run, whether on premise, public cloud, private cloud, bare metal, etc".

#### Installation

The [devtools.sh script](#devtoolssh-script) installs Docker.

## Section 3: Developer Apps

### Google Chrome

<p align="center">
  <img src="https://pbs.twimg.com/profile_images/1037025533182193664/aCWlGSZF_400x400.jpg" width="250" height="250">
  <br/>
</p>

[Google Chrome](https://www.google.com/chrome/) is the most popular web browser from the house of google inc.

#### Installation

The [devapps.sh script](#devappssh-script) installs Google Chrome.

### Visual Studio Code

<p align="center">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Visual_Studio_Code_1.18_icon.svg/512px-Visual_Studio_Code_1.18_icon.svg.png" width="250" height="250">
    <br/>
</p>

[Visual Studio Code](https://code.visualstudio.com/) is a code editor redefined and optimized for building and debugging modern web and cloud applications. It includes support for debugging, embedded Git control, syntax highlighting, intelligent code completion, snippets, and code refactoring.

#### Installation

The [devapps.sh script](#devappssh-script) installs Visual Studio Code.

### Postman

<p align="center">
    <img src="https://www.getpostman.com/img/v2/products/equation-postman.svg" width="250" height="250">
    <br/>
</p>

[Postman](https://www.getpostman.com/) makes API development faster, easier, and better.

#### Installation

The [devapps.sh script](#devappssh-script) installs Postman.

### Sky for linux

<p align="center">
    <img src="https://access.redhat.com/sites/default/files/sky.png" width="250" height="250">
    <br/>
</p>

[Sky For Linux](https://tel.red/linux.php) is an unofficial client for skype for business.

#### Installation

The [devapps.sh script](#devappssh-script) installs Sky For Linux.

### VLC

<p align="center">
    <img src="https://upload.wikimedia.org/wikipedia/commons/3/38/VLC_icon.png" width="250" height="250">
    <br/>
</p>

[VLC Media Player](https://www.videolan.org/vlc/) is a free and open-source, portable, cross-platform media player and streaming media server.

### Spotify

<p align="center">
    <img src="https://developer.spotify.com/assets/branding-guidelines/icon4@2x.png" width="250" height="250">
    <br/>
</p>

[Spotify](https://www.spotify.com) Spotify is a digital music streaming service that gives you access to millions of songs and curated playlists.

#### Installation

The [devapps.sh script](#devappssh-script) installs Spotify.

## Section 4: Data Science Tools

### Anaconda Distribution

<p align="center">
    <img src="https://www.anaconda.com/wp-content/uploads/2017/08/Anaconda-Distribution-Diagram.png">
    <br/>
</p>

[Anaconda Distribution](https://www.anaconda.com/distribution/) is a free, easy-to-install package manager, environment manager and Python distribution with a collection of 1,000+ open source packages provided by Continuum Analytics.

#### Installation

The [datasciencetools.sh script](#datasciencetoolsh-script) installs Anaconda Distribution.

## Section 5: Data Stores

### Redis

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/redis.png">
  <br/>
</p>

[Redis](http://redis.io/) is a blazing fast, in-memory, key-value store, that uses the disk for persistence. It's kind of like a NoSQL database, but there are a lot of [cool things](http://oldblog.antirez.com/post/take-advantage-of-redis-adding-it-to-your-stack.html) that you can do with it that would be hard or inefficient with other database solutions. For example, it's often used as session management or caching by web apps, but it has many other uses.

#### Installation

The [datastores.sh script](#datastoressh-script) installs Redis.

### MongoDB

<p align="center">
  <img src="https://webassets.mongodb.com/_com_assets/cms/MongoDB-Logo-5c3a7405a85675366beb3a5ec4c032348c390b3f142f5e6dddf1d78e2df5cb5c.png" width="650" height="250">
  <br/>
</p>

[MongoDB](http://mongodb.com/) is a free and open-source cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with schemata.

#### Installation

The [datastores.sh script](#datastoressh-script) installs MongoDB.

## Section 6: Big Data Platforms, AWS

***This section is under development.***

## Section 7: Utilities

### Xpad
<p align="center">
  <img src="https://launchpadlibrarian.net/17786054/xpad64.png">
  <br/>
</p>

[Xpad](https://launchpad.net/xpad) is a sticky note application for jotting down things to remember.

#### Installation

The [utilities.sh script](#utilitiessh-script) installs Xpad.

### Redshift
<p align="center">
  <img src="http://jonls.dk/assets/redshift-icon-256.png">
  <br/>
</p>

[Redshift](http://jonls.dk/redshift/) adjusts the color temperature of your screen according to your surroundings. This may help your eyes hurt less if you are working in front of the screen at night. 

#### Installation

The [utilities.sh script](#utilitiessh-script) installs Redshift.

## Section 8: Libraries

### thefuck

[thefuck](https://github.com/nvbn/thefuck) is an app which corrects your previous console command.

#### Installation

The [libraries.sh script](#librariessh-script) installs thefuck.

### beautysh

[beautysh](https://github.com/bemeurer/beautysh) is a bash beautifier.

#### Installation

The [libraries.sh script](#librariessh-script) installs beautysh.

## Section 9: Miscellaneous

### tweaks

Ubuntu Tweaks - [See for yourself](https://github.com/naushads/dev-setup/blob/master/miscellaneous.sh)

#### Installation

The [miscellaneous.sh script](#miscellaneoussh-script) configures tweaks.

## Section 10: Bash Customizations

### promptstring

<p align="center">
  <img src="https://user-images.githubusercontent.com/7782134/45997718-2ca30300-c0be-11e8-96a9-d53e9ea63d7c.png">
  <br/>
</p>

A cool looking command prompt string which shows current branch name if in git repository folder which looks something like this.

[Refer](https://github.com/naushads/dev-setup/blob/master/bashcustomization.sh)

#### Installation

The [bashcustomizations.sh script](#bashcustomizationssh-script) configures prompt string.

### bashaliases

Aliases for some commonly used command

[Refer](https://github.com/naushads/dev-setup/blob/master/bashcustomization.sh)

#### Installation

The [bashcustomizations.sh script](#bashcustomizationssh-script) configures bash aliases.

## Section 11: Misc

### Contributions

Bug reports, suggestions, and pull requests are [welcome](https://github.com/naushadS/dev-setup/issues)!

### Credits

See the [Credits Page](https://github.com/naushadS/dev-setup/blob/master/CREDITS.md).

### Contact Info

Feel free to contact me to discuss any issues, questions, or comments.

My contact info can be found on my [GitHub page](https://github.com/naushadS).

### License

This repository contains a variety of content; some developed by Naushad Shukoor; some developed by Donne Martin.

The content developed by Naushad Shukoor is distributed under the following license:

    MIT License

    Copyright (c) 2018 Naushad Shukoor

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.

The content developed by Donne Martin is distributed under the following license:

    Copyright 2015 Donne Martin

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
