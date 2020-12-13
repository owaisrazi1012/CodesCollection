#!/bin/bash
grep "<interfaceId>" obdx_jms.log | sed 's/<interfaceId>//g;s/<\/interfaceId>//g' | awk '!a[$0]++'