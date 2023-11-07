class DoctorVisit {
  final String patientName;
  final DateTime visitDate;
  final String diagnosis;

  DoctorVisit({
    required this.patientName,
    required this.visitDate,
    required this.diagnosis,
  });
}
Future<List<DoctorVisit>> fetchDoctorVisits() async {
  // Simulate fetching data from a data source or API
  await Future.delayed(Duration(seconds: 2));
  return List.generate(10, (index) {
    return DoctorVisit(
      patientName: 'Patient $index',
      visitDate: DateTime.now().subtract(Duration(days: index)),
      diagnosis: 'Diagnosis for Patient $index',
    );
  });
}