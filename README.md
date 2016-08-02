# Ant deployment for Apache Solr

## Motivation

Lots of people use chef/puppet to deploy Solr.   That's great if you have root.

How do you automate an update of this stuff on an existing server without root?

What do you do if your Dev. Ops. team may be more familiar with JAva tools than
Linux shell scripts?

## Summary

An ant build that installs assuming the following setup:

- Directory /opt/solr exists and has owner and group solradm
- Directory /var/opt/solr exists and has owner and group solrapp, and is
  group-writable and setgid
- Java and ant are installed and work
- The solradm user is in the solrapp group, and so create directories owned by
  solrapp.
- The solradm user has a home directory that is not the same as /opt/solr
- You have a login and can become solradm

## Status/Disclaimer

This code is forked from my main branch which has some stuff I must keep private. If you use it, please contribute back.  If that happens, we can build a travis CI for this, and keep it tested.  Let's be honest though - puppet, chef, or ansible is a better solution.

## Using this

- Look at build.properties and the templates/ sub-directory and customize
  anything you need to customize
- Download Solr, Zookeeper, etc.

```
ant download
```

- Become solradm

- If this is the first time, initialize the account and then 

```
ant setup-solradm
. ~/.bash_profile
```

- Install solr (and zookeeper)

```
ant install
```

- This install can also setup /etc/httpd/conf/httpd.conf and /etc/httpd/conf.d
  on CentOS, but Dev. Ops.  will manage that after initial installation.

```
ant install-httpd-config
```

## What does root do

- Install the solr and zookeeper initscripts, still called nlm-solr and nlm-zookeper in this code

## Operational Assumptions

This came about at the U.S. National Library of Medicine (NLM) Office of
Communications and Computer Systems (OCCS).

It differs from the `install_solr_service.sh` script in having opinions about our
own configuration, most especially security.   We may not have Solr run with a
user that has a login shell, and we are discouraged from having that same user
be able to modify the code (directories in the Java CLASSPATH).   

Similarly, we must have high standards on the access to the Solr admin UI.   We
have a Jasiq CAS server we commonly use, and we protect /solr with `mod_auth_cas`.

The details on hostnames and URLs have been changed to protect our privacy.
Some filenames remain prefixed with 'nlm-'

## License

This is a public work of the United States of America prepared by an officer or
employee of the federal government.   It is public domain.

