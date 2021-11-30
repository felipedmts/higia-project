String myCountAge(DateTime? birthDate) {
  DateTime dataAtual = DateTime.now();
  int difference = ((dataAtual.difference(birthDate!).inDays) / 365).toInt();

  return difference.toString();
}
