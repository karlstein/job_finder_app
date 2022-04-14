import 'package:cloud_firestore/cloud_firestore.dart';

class SkillModel {
  String? id;
  String? skill;
  String? describe;
  String? email;

  SkillModel({this.id, this.email, this.skill, this.describe});

  SkillModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    skill = snapshot['Skill'];
    describe = snapshot['Describe'];
    email = snapshot['Email'];
  }

  SkillModel.fromList(snapshot) {
    id = snapshot.id;
    skill = snapshot['Skill'];
    describe = snapshot['Describe'];
    email = snapshot['Email'];
  }
}
