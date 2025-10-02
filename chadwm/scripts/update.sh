#!/bin/sh
#
#

CHADWM="$HOME/dotfiles/chadwm"
CHADWM_DIR="$HOME/.local/chadwm"
CHADWM_URL="https://github.com/siduck/chadwm.git"

# Clone if not exists
if [ ! -d "${CHADWM_DIR}" ]; then
    git clone "${CHADWM_URL}" "${CHADWM_DIR}"
fi

cd "${CHADWM_DIR}" || exit

# Current local commit
CURRENT_COMMIT_HASH=$(git rev-parse HEAD)

# Fetch latest changes
git fetch origin

# Latest remote commit (change branch if not master)
LATEST_COMMIT_HASH=$(git rev-parse origin/master)

cd - >/dev/null || exit

echo "Current: ${CURRENT_COMMIT_HASH}"
echo "Latest:  ${LATEST_COMMIT_HASH}"

# Compare and update if needed
if [ "${CURRENT_COMMIT_HASH}" != "${LATEST_COMMIT_HASH}" ]; then
    echo "Updating chadwm..."
    cd "${CHADWM_DIR}" || exit
    git reset --hard origin/master
    cd - >/dev/null || exit
else
    echo "No updates."
fi

# Compare configs
diff -u "${CHADWM_DIR}/config.def.h" "${CHADWM}/config.def.h"

