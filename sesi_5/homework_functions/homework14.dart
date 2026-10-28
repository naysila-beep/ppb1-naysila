void main() {
  var nilai =[70, 80, 90, 65, 60];
  
  var lulus = nilai.where((item) {
    return item >= 60;
  }).toList();
  
  print(lulus);
}
