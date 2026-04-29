#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
	gui_.setup();
	cam_.setPosition({0, 0, 100});
	cam_.lookAt({0, 0, 0});
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
	cam_.begin();
	ofDrawGrid(20.0f, 5, true, false, true, false);
	ofPushMatrix();
	ofMultMatrix(node_.getGlobalTransformMatrix());
	ofSetColor(255, 180, 80);
	ofDrawBox(12.0f);
	ofSetColor(255);
	ofDrawAxis(16.0f);
	ofPopMatrix();
	cam_.end();
	
	gui_.begin();
	ImGui::Begin("ImGuizmo Example");
	ImGui::TextUnformatted("Keys: W translate, E scale, R rotate, Space local/world");
	ImGui::Separator();
	if(ImGui::RadioButton("Translate", op_ == ImGuizmo::TRANSLATE)) op_ = ImGuizmo::TRANSLATE;
	ImGui::SameLine();
	if(ImGui::RadioButton("Scale", op_ == ImGuizmo::SCALE)) op_ = ImGuizmo::SCALE;
	ImGui::SameLine();
	if(ImGui::RadioButton("Rotate", op_ == ImGuizmo::ROTATE)) op_ = ImGuizmo::ROTATE;
	if(ImGui::RadioButton("Local", mode_ == ImGuizmo::LOCAL)) mode_ = ImGuizmo::LOCAL;
	ImGui::SameLine();
	if(ImGui::RadioButton("World", mode_ == ImGuizmo::WORLD)) mode_ = ImGuizmo::WORLD;
	const auto position = node_.getPosition();
	ImGui::Text("Position: %.2f, %.2f, %.2f", position.x, position.y, position.z);
	ImGui::End();

	ImGuizmo::BeginFrame();
	ImGuizmo::Manipulate(cam_, node_, op_, mode_);
	gui_.end();
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
	switch(key) {
		case 'w': op_ = ImGuizmo::TRANSLATE; break;
		case 'e': op_ = ImGuizmo::SCALE; break;
		case 'r': op_ = ImGuizmo::ROTATE; break;
		case ' ': mode_ = mode_==ImGuizmo::LOCAL?ImGuizmo::WORLD:ImGuizmo::LOCAL; break;
	}
}