#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Nho Luong
#  Date: 2015-06-28 13:44:33 +0100 (Sun, 28 Jun 2015)
#
#  https://github.com/nholuongut/lib
#
#  License: see accompanying Nho Luong LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help improve or steer this or other code I publish
#
#  https://www.linkedin.com/in/nholuong
#

set -euo pipefail
srcdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd "$srcdir/.."

# shellcheck disable=SC1091
. bash-tools/lib/utils.sh

section "Checking for uncovered subs"

start_time="$(start_timer)"

found=0
while read -r sub; do
    if ! grep -Fq "$sub" nholuongutUtils.pm; then
        echo "$sub is not covered by unit tests"
        ((found++))
    fi
done < <(grep sub nholuongutUtils.pm | sed 's/^sub //;s/ .*//;/^[[:space:]]*$/d')
echo "Found $found uncovered subroutines"
[ $found -eq 0 ] || exit 1

time_taken "$start_time"
section2 "Finished checking for uncovered subs"
