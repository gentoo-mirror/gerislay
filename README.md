# Gerislay

Personal overlay of Gerion.

## Masking
Feel free to use any of the ebuilds, but don't expect stable ones. 

I recommend to add:
```
*/*::gerislay
```
to your package.mask.

## Installation
To use this overlay with layman, add the url to the overlays variable in `/etc/layman/layman.cfg`:
```
https://git.finf.uni-hannover.de/Chrysops/gerislay/raw/master/repositories.xml
```
and then
```
layman -a gerislay
```

Improvements and Pull Requests are welcome. Please open an issue for this.
