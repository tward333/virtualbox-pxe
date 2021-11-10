
outputdir="/opt/easydcim_remote/system/cache/sysrcd803_mojo/sysresccd/x86_64/"

rm -rf merge $outputdir/merge $outputdir/mojo.sfs

mkdir merge
unsquashfs -f -d ./merge airootfs_orig.sfs 
unsquashfs -f -d ./merge mojo.sfs 
rsync -avP merge/upperdir/ merge/
rm -rfv merge/upperdir/ merge/workdir

mksquashfs merge/ airootfs.sfs -noappend
rsync -avP airootfs.sfs $outputdir/airootfs.sfs 
