dev-setup
==========

## Motivation

Setting up a new developer machine can be an **ad-hoc, manual, and time-consuming** process.  `dev-setup` aims to **simplify** the process with **easy-to-understand instructions** and **dotfiles/scripts** to **automate the setup** of the following:

* **Developer tools**: git, Python, Node.js, etc
* **Developer apps**: Chrome, Mozilla, Visual Studio Code, Docker etc
* **Data Science Tools**: IPython Notebook, NumPy, Pandas, Scikit-Learn, Matplotlib, Seaborn etc
* **Common data stores**: MySQL, PostgreSQL, MongoDB, Couchbase, Redis, and Elasticsearch
* **Big Data platforms**: Spark (with IPython Notebook integration) and MapReduce
* **Utilities**: xpad, Redshift


### But...I Don't Need All These Tools!

**`dev-setup` is geared to be more of an organized *reference* of various developer tools.**

**You're *not* meant to install everything.**

If you're interested in automation, `dev-setup` provides a customizable [setup script](#single-setup-script).  There's really no one-size-fits-all solution for developers so you're encouraged to make tweaks to suit your needs.

[Credits](#credits): This repo builds on the awesome work from [Donne Martin](https://github.com/donnemartin) who built the same thing for Mac OS X Environment, the repository of which is [donnemartin/dev-setup](https://github.com/donnemartin/dev-setup).

### Sections Summary
* Section 1 contains the scripts and instructions to set up your system.
* Sections 2 through 8 detail more information about installation, configuration, and usage for topics in Section 1.

## Section 1: Installation

**Scripts tested on Ubuntu 16.04**

* [Single Setup Script](#single-setup-script)
* [datastores.sh script](#datastoressh-script)
    * Sets up Redis (open-source in-memory database project implementing a distributed, in-memory key-value store with optional durability.)
* [devtools.sh script](#devtools-script)
    * Sets up Docker (open source software platform to create, deploy and manage virtualized application containers)
* [utils.sh script](#utils-script)
    * Sets up XPAD (Simple Sticky note App.)
    * Sets up Redshift (Redshift adjusts the color temperature according to the position of the sun.  This may help your eyes hurt less if you are working in front of the screen at night.)

## Section 2: Developer Tools

* [Git](#git)
* [Docker](#docker)
* [Python](#python)
* [Pip](#pip)
* [Node.js](#node.js)

## Section 3: Developer Apps

* [Chrome](#chrome)
* [Mozilla](#mozilla)
* [Visual Studio Code](#visualstudiocode)
* [Docker](#docker)

## Section 4: Data Science Tools

* [Anaconda](#anaconda)
* [IPython Notebook](#ipython-notebook)
* [NumPy](#numpy)
* [Pandas](#pandas)
* [Matplotlib](#matplotlib)
* [Seaborn](#seaborn)
* [Scikit-learn](#scikit-learn)
* [SciPy](#scipy)
* [Bokeh](#bokeh)

## Section 5: Data Stores

* [MySQL](#mysql)
* [PostgreSQL](#postgresql)
* [MongoDB](#mongodb)
* [couchbase](#couchbase)
* [Redis](#redis)
* [Elasticsearch](#elasticsearch)

## Section 6: Big Data Platforms, AWS

* [Spark](#spark)
* [MapReduce](#mapreduce)
* [AWS Machine Learning](#aws-machine-learning)

## Section 7: Utilities

* [xpad](#xpad)
* [Redshift](#redshift)

## Section 8: Misc

* [Contributions](#contributions)
* [Credits](#credits)
* [Contact Info](#contact-info)
* [License](#license)

## Section 1: Installation

### Single Setup Script

#### Running with Git

##### Clone the Repo

    $ git clone https://github.com/naushads/dev-setup.git && cd dev-setup

**Since you probably don't want to install every section**, the `main.sh` script supports command line arguments to run only specified sections.  Simply pass in the [scripts](#scripts) that you want to install.  Below are some examples.

**For more customization, you can [clone](#clone-the-repo) or [fork](https://github.com/naushads/dev-setup/fork) the repo and tweak the `main` script and its associated components to suit your needs.**

Run all:

    $ bash main.sh all

Run `devtools.sh` and `utils.sh`:

    $ bash main.sh devtools utils

#### Running without Git

    $ curl -O https://raw.githubusercontent.com/naushads/dev-setup/master/main && bash main.sh [Add ARGS Here]

#### Scripts

* [main](https://github.com/naushads/dev-setup/blob/master/main.js)
    * Runs specified scripts
* [devtools.sh](https://github.com/naushads/dev-setup/blob/master/devtools.sh)
    * Sets up Devtools(Docker)
* [datastores.sh](https://github.com/naushads/dev-setup/blob/master/datastores.sh)
    * Sets up Data Stores(Redis)
* [utils.sh](https://github.com/naushads/dev-setup/blob/master/utils.sh)
    * Sets up Utility Apps(Xpad and Redshift)

**Notes:**

* `main.sh` will initially prompt you to enter your password.
* `main.sh` might ask you to re-enter your password at certain stages of the installation.
* If ubuntu(linux) updates require a restart, simply run `main.sh` again to resume where you left off.
* `main.sh` runs `sudo apt-get update` command, which takes a while to complete as some libraries need to be installed before proceeding.
* **When `main.sh` completes, be sure to restart your computer for all updates to take effect.**

I encourage you to read through Section 1 so you have a better idea of what each installation script does.  The following discussions describe in greater detail what is executed when running the [main.sh](https://github.com/naushads/dev-setup/blob/master/main.sh) script.

### devtools.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/commands.png">
  <br/>
</p>

To set up developer tools, run the `devtools.sh` script:

    $ ./devtools.sh

### datastores.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/datastores.png">
  <br/>
</p>

To set up common data stores, run the `datastores.sh` script:

    $ ./datastores.sh

[Section 5: Data Stores](#section-5-data-stores) describes the installed packages and usage.

### utilities.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/xcode.jpg">
  <br/>
</p>

To set up utilities, run the `utilities.sh` script:

    $ ./utilities.sh

## Section 2: Developer Tools

***This section is under development.***

## Section 3: Developer Apps

### Docker

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/docker.png">
  <br/>
</p>

Docker automates the deployment of applications inside software containers.  I think the following [quote](http://www.linux.com/news/enterprise/cloud-computing/731454-docker-a-shipping-container-for-linux-code) explains docker nicely: "Docker is a tool that can package an application and its dependencies in a virtual container that can run on any Linux server. This helps enable flexibility and portability on where the application can run, whether on premise, public cloud, private cloud, bare metal, etc".

#### Installation

The [devtools.sh script](#devtoolssh-script) installs Docker.

## Section 4: Data Science Tools

***This section is under development.***

## Section 5: Data Stores

### Redis

<p align="center">
  <img src="https://raw.githubusercontent.com/donnemartin/dev-setup-resources/master/res/redis.png">
  <br/>
</p>

[Redis](http://redis.io/) is a blazing fast, in-memory, key-value store, that uses the disk for persistence. It's kind of like a NoSQL database, but there are a lot of [cool things](http://oldblog.antirez.com/post/take-advantage-of-redis-adding-it-to-your-stack.html) that you can do with it that would be hard or inefficient with other database solutions. For example, it's often used as session management or caching by web apps, but it has many other uses.

#### Installation

The [datastores.sh script](#datastoressh-script) installs Redis.

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

## Section 8: Misc

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