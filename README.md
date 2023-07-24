# Radicale autogit

Radicale autogit is a custom build of the radicale container image with builtin git autocommit of changes to collections.
It uses bcrypt for the credentials file, which can be mounted at `/etc/radicale/auth/credentials`.

The collections are stored under `/var/lib/radicale`.

The specific version of radicale to build can be specified through the build argument `RADICALE_VERSION`.
By default it points to the `master` branch, but can be changed to point to tags.
See https://github.com/Kozea/Radicale for all available versions.