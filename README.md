# GhostX Sileo repo

Static APT/Sileo repository for `com.sgwc.ghostx`.

## Host it
The simplest host is GitHub Pages:

```sh
./publish-github.sh jaffatherealest/ghostx-repo
```

That creates a **public** repository, pushes this directory, and enables Pages.
The Sileo source URL is then:

```
https://jaffatherealest.github.io/ghostx-repo/
```

Open Sileo -> Sources -> Add, paste that URL, refresh, then install **GhostX**.
After install, the settings are at **Settings -> GhostX**.

If you use another host, upload the whole directory so `Packages`, `Packages.gz`,
`Release`, `debs/` and `CydiaIcon.png` are all at the repo root.

## Rebuild
From `ghostx/`:

```sh
cp dist/com.sgwc.ghostx_0.6.0_iphoneos-arm64.deb repo/debs/
cd repo
dpkg-scanpackages debs /dev/null > Packages
gzip -kf Packages
```
