#!/bin/bash
export ELECTRON_ENABLE_LOGGING=1
export ELECTRON_DEBUG_ALWAYS=1
exec /usr/bin/hydralauncher --no-sandbox
