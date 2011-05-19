#!/bin/sh

# $Id: doinst.sh 890 2008-09-19 10:56:49Z bfg $
# $Date: 2008-09-19 12:56:49 +0200 (Fri, 19 Sep 2008) $
# $Author: bfg $
# $Revision: 890 $
# $LastChangedRevision: 890 $
# $LastChangedBy: bfg $
# $LastChangedDate: 2008-09-19 12:56:49 +0200 (Fri, 19 Sep 2008) $

config() {
        NEW="$1"
        OLD="`dirname $NEW`/`basename $NEW .new`"

        # If there's no config file by that name, mv it over:
        if [ ! -r "$OLD" ]; then
                mv "$NEW" "$OLD"
        elif [ "`cat $OLD | md5sum`" = "`cat $NEW | md5sum`" ]; then # toss the redundant copy
                rm -f "$NEW"
        fi

        # Otherwise, we leave the .new copy for the admin to consider...
}

# find *.new files in etc/firewall
for f in `find etc/firewall -type f -name '*.new'`; do
	config "$f"
done

# EOF
