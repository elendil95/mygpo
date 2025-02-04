mygpo - Source for gpodder.net
==============================

mygpo is the website and webservice powering gpodder.net.


License
-------
mygpo is licensed under the GNU Affero General Public License Version 3. See file [COPYING](COPYING) for details.


Installation
------------
See the [installation instructions](https://gpoddernet.readthedocs.io/en/latest/dev/installation.html) for details.\
Following the instructions here will work perfectly on Debian 11 (Python 3.9)


Bugs
----
Please report bugs in the [GitHub issue tracker](https://github.com/gpodder/mygpo/issues).


Contributing
------------
gpodder.net is an open source project and your contributions are wanted and appreciated.  To get started please see the [developer documentation](https://gpoddernet.readthedocs.io/en/latest/dev/index.html).

Slack
------------
Join our Slack channel: [gpodder-net.slack.com](https://gpodder-net.slack.com/)

[Invitation link](https://join.slack.com/t/gpodder-net/shared_invite/zt-aaiagl5i-uZeqVR8w1Yf_G~9rhktRfw)

Mailing List
------------
gpodder.org related issues are discussed on the [gPodder Mailing List](https://gpodder.github.io/docs/mailing-list.html).


Documentation
-------------
Documentation, especially for the API, is stored in the [**doc** folder](https://github.com/gpodder/mygpo/tree/master/doc) and can be read on [ReadTheDocs](https://gpoddernet.readthedocs.io/en/latest/index.html).

How to setup the postres database
----------------
Postgress setup
- yum module install postgresql:15/server
- postgresql-setup --initdb
- systemctl enable --now postgresql
- sudo -u postgres psql

```sql
CREATE USER mygpo WITH PASSWORD 'mygpo';
ALTER USER mygpo CREATEDB;  -- required for creating test database
CREATE DATABASE mygpo;
CREATE DATABASE test_mygpo;
GRANT ALL PRIVILEGES ON DATABASE mygpo to mygpo;
GRANT ALL PRIVILEGES ON DATABASE test_mygpo to mygpo;
ALTER DATABASE mygpo OWNER TO mygpo;
ALTER DATABASE test_mygpo OWNER TO mygpo;
ALTER ROLE mygpo SET statement_timeout = 5000;
```

Name (Why mygpo?)
------------------
mygpo is a short version of "my.gpodder.org" which was the old [domain] name of gpodder.net and has been used as the project name since then.

