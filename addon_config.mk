meta:
	ADDON_NAME = ofxImGuizmo
	ADDON_DESCRIPTION = openFrameworks wrapper for ImGuizmo
	ADDON_AUTHOR = Nariaki Iwatani
	ADDON_TAGS = "ImGui" "dear ImGui" "gizmo" "LibGizmo" "ImGuizmo"
	ADDON_URL = https://github.com/nariakiiwatani/ofxImGuizmo

common:
	# Build from the committed vendor snapshot so users don't need to init
	# the ImGuizmo submodule. See libs/UpdateImGuizmo.sh for refreshes.
	ADDON_INCLUDES += libs/ImGuizmoVendored
	ADDON_SOURCES += libs/ImGuizmoVendored/ImGuizmo.cpp

	ADDON_INCLUDES_EXCLUDE = libs/ImGuizmo/example%
	ADDON_INCLUDES_EXCLUDE += libs/ImGuizmo/bin%
	ADDON_INCLUDES_EXCLUDE += libs/ImGuizmo/%
	ADDON_SOURCES_EXCLUDE = libs/ImGuizmo/example%
	ADDON_SOURCES_EXCLUDE += libs/ImGuizmo/bin%
	ADDON_SOURCES_EXCLUDE += libs/ImGuizmo/vcpkg-example%
	ADDON_SOURCES_EXCLUDE += libs/ImGuizmo/%
