class Calculations {
  Calculations({this.weight, this.height});

  int weight;
  int height;

  double __bmi = 0.0;
  double bmi1() {
    __bmi = (weight / ((height / 100) * (height / 100)));
    return __bmi;
  }

  String remarks() {
    if (__bmi < 18.5) {
      return 'Under Weight';
    } else if (__bmi > 18.5 && __bmi < 24.5) {
      return 'Normal';
    } else {
      return 'Overweight';
    }
  }

  String comments() {
    if (__bmi < 18.5) {
      return 'Your body weight is too low for your height';
    } else if (__bmi > 18.5 && __bmi < 24.5) {
      return 'You have a normal body weight ..Great!!';
    } else {
      return 'Your body weight is too much for your height';
    }
  }
}
