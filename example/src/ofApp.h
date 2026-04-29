#pragma once

#include "ofMain.h"
#include "ofxImGui.h"
#include "ofxImGuizmo.h"

class ofApp : public ofBaseApp{

public:
	void setup();
	void update();
	void draw();

	void keyPressed(int key);

private:
	ofCamera cam_;
	ImGuizmo::OPERATION op_ = ImGuizmo::TRANSLATE;
	ImGuizmo::MODE mode_ = ImGuizmo::LOCAL;
	ofNode node_;
	ofxImGui::Gui gui_;
};