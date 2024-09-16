import 'confidence_data.dart';

class ModelAnalysis{

  String title;
  String opinion;
  List<ConfidenceData> modelConfidenceData=[];
  ModelAnalysis({required this.title,required this.modelConfidenceData,required this.opinion});
}