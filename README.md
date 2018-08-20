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
* [utils.sh script](#pydatash-script)
    * Sets up Redshift

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
