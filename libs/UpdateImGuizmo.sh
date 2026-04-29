#!/usr/bin/env bash
set -euo pipefail

# Refresh the committed ImGuizmo vendor snapshot from the submodule.
# Normal addon users build from libs/ImGuizmoVendored and do not need submodules.

VERSION_SHA="${VERSION_SHA:-bafc04f2dfedfc12bef8f20c0566e887626f0495}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ADDON_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SUBMODULE_DIR="${ADDON_ROOT}/libs/ImGuizmo"
VENDOR_DIR="${ADDON_ROOT}/libs/ImGuizmoVendored"

echo "Updating ImGuizmo vendor snapshot from ${VERSION_SHA}"

git -C "${ADDON_ROOT}" submodule sync -- libs/ImGuizmo
git -C "${ADDON_ROOT}" submodule update --init --recursive libs/ImGuizmo
git -C "${SUBMODULE_DIR}" fetch origin
git -C "${SUBMODULE_DIR}" reset --hard "${VERSION_SHA}"

mkdir -p "${VENDOR_DIR}"
cp "${SUBMODULE_DIR}/ImGuizmo.h" "${VENDOR_DIR}/ImGuizmo.h"
cp "${SUBMODULE_DIR}/ImGuizmo.cpp" "${VENDOR_DIR}/ImGuizmo.cpp"
cp "${SUBMODULE_DIR}/LICENSE" "${VENDOR_DIR}/LICENSE"

echo "Done. Review and commit libs/ImGuizmoVendored after testing."
