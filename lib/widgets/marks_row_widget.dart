import 'package:untitled1/models/marks_model.dart';
import 'package:untitled1/models/term_model.dart';
import 'package:untitled1/widgets/marks_textfield_widget.dart';
import 'package:flutter/material.dart';

class MarksRow extends StatefulWidget {
  final Marks marks;
  // final double total;
  // final String grade;

  const MarksRow({
    required this.marks,
    // required this.total,
    // required this.grade,
    Key? key,
  }) : super(key: key);

  @override
  State<MarksRow> createState() => _MarksRowState();
}

class _MarksRowState extends State<MarksRow> {
  final List<TextEditingController> _term1Controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final List<TextEditingController> _term2Controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final TextEditingController _totalController =
  TextEditingController(text: "0");
  final TextEditingController _gradeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initialTotal();
  }

  void _initialTotal() {
    Term term1 = widget.marks.term1 ?? Term(marks: []);
    Term term2 = widget.marks.term2 ?? Term(marks: []);
    _totalController.text = widget.marks.getTotal(term1, term2).toString();
    _gradeController.text =
        widget.marks.getGrade(widget.marks.getTotal(term1, term2));
  }

  void _calculateTotal() {
    double term1 = _term1Controller.fold(
        0,
            (previousValue, element) =>
        previousValue +
            double.parse(element.text.isEmpty ? "0" : element.text));
    double term2 = _term2Controller.fold(
        0,
            (previousValue, element) =>
        previousValue +
            double.parse(element.text.isEmpty ? "0" : element.text));
    _totalController.text = (term1 + term2).toString();
    _gradeController.text = widget.marks.getGrade(term1 + term2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: const Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(widget.marks.subject ?? ""),
          ),
          Row(
            children: [
              Row(
                children: _term1Controller.map(
                      (controller) {
                    var i = _term1Controller.indexOf(controller);

                    var mark = ((widget.marks.term1 ?? Term(marks: [])).marks ??
                        [])[i];
                    controller.text = "$mark";

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: SizedBox(
                        width: 75,
                        child: MarksTextField(
                          controller: controller,
                          onChange: (newVal) => _calculateTotal(),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              Row(
                children: _term2Controller.map(
                      (controller) {
                    var i = _term2Controller.indexOf(controller);

                    var mark = ((widget.marks.term2 ?? Term(marks: [])).marks ??
                        [])[i];

                    controller.text = "$mark";

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: SizedBox(
                        width: 75,
                        child: MarksTextField(
                          controller: controller,
                          onChange: (newVal) => _calculateTotal(),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: 90,
              child: MarksTextField(
                controller: _totalController,
                readOnly: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: 90,
              child: MarksTextField(
                controller: _gradeController,
                readOnly: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: 90,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.save),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
