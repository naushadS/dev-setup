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

## Section 5: Big Data Platforms, AWS

* [Spark](#spark)
* [MapReduce](#mapreduce)
* [AWS Machine Learning](#aws-machine-learning)

## Section 6: Utilities

* [xpad](#xpad)
* [Redshift](#redshift)

## Section 7: Misc

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
* [utils.sh](https://github.com/naushads/dev-setup/blob/master/utils.sh)
    * Sets up Utility Apps(Xpad and Redshift)

**Notes:**

* `main.sh` will initially prompt you to enter your password.
* `main.sh` might ask you to re-enter your password at certain stages of the installation.
* If ubuntu(linux) updates require a restart, simply run `main.sh` again to resume where you left off.
* `main.sh` runs `sudo apt-get update` command, which takes a while to complete as some libraries need to be installed before proceeding.
* **When `main.sh` completes, be sure to restart your computer for all updates to take effect.**

I encourage you to read through Section 1 so you have a better idea of what each installation script does.  The following discussions describe in greater detail what is executed when running the [main.sh](https://github.com/naushads/dev-setup/blob/master/main.sh) script.