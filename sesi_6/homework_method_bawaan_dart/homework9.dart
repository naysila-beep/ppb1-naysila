void main() {
  Set<String> hadir = {'Mamal', 'Mumul'};

  hadir.add('Memel');
  hadir.add('Mamal');
  print(hadir);

  hadir.remove('Mumul');
  print(hadir);

  print(hadir.contains('Mumul'));
  print(hadir.length);
}
