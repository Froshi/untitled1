import 'package:untitled1/models/term_model.dart';

class Marks {
  String? subject;
  Term? term1;
  Term? term2;

  Marks({
    this.subject,
    this.term1,
    this.term2,
  });

  List<Marks> get getMarks => [
    Marks(
      subject: "English",
      term1: Term(marks: [16, 18, 17]),
      term2: Term(marks: [17, 19, 16]),
    ),
    Marks(
      subject: "Maths",
      term1: Term(marks: [20, 19, 19]),
      term2: Term(marks: [19, 20, 20]),
    ),
    Marks(
      subject: "Science",
      term1: Term(marks: [19, 20, 20]),
      term2: Term(marks: [18, 20, 19]),
    ),
    Marks(
      subject: "Geography",
      term1: Term(marks: [20, 20, 18]),
      term2: Term(marks: [20, 20, 19]),
    ),
    Marks(
      subject: "Hindi",
      term1: Term(marks: [17, 18, 17]),
      term2: Term(marks: [18, 17, 17]),
    ),
  ];

  double getTotal(Term term1, Term term2) {
    double term1Total = ((term1).marks ?? [])
        .fold(0, (previousValue, element) => previousValue + element);

    double term2Total = ((term2).marks ?? [])
        .fold(0, (previousValue, element) => previousValue + element);

    return term1Total + term2Total;
  }

  String getGrade(double total) {
    if (total == 0 ) {
      return " ";
    } else if (total > 115.2) {
      return "A+";
    }else if (total > 108) {
      return "A";
    } else if (total > 103) {
      return "B+";
    } else if (total > 96) {
      return "B";
    } else if (total > 91) {
      return "C+";
    } else if (total > 84) {
      return "C";
    } else if (total > 79.2) {
      return "D+";
    } else if (total > 72) {
      return "D";
    } else if (total > 66) {
      return "E";
    }else {
      return "F";
    }
  }
}
