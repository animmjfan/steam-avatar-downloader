#!/usr/bin/env bash

steamCommunityUrl=https://steamcommunity.com
profileId=YOURPROFILEIDHERE
profile="$steamCommunityUrl/id/$profileId"

imageLocationInSourceHtml=$(curl -s $profile | grep image_src) # example output: <link rel="image_src" href="https://avatars.fastly.steamstatic.com/3ea3ce27118f0eb45f50bfd7a229b17f54ee0a6d_full.jpg">
setIncludingHref=($imageLocationInSourceHtml) # split into a set of 3 strings including <link, rel="image_src" and href="IMAGEURLHERE">
link=$( echo ${setIncludingHref[2]%>} | sed 's/href=//; s/"//g' )
curl $link -o image.jpg
