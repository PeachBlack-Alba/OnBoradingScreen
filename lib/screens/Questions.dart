import 'package:flutter/material.dart';
import 'InterestHobbies.dart';
import 'Stepper.dart';

class Questions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: HorizontalStepper(
            steps: [
              HorizontalStep(
                title: '',
                widget: Center(
                  child: InterestHobbies(),
                ),
                state: HorizontalStepState.SELECTED,
                isValid: true,
              ),
              HorizontalStep(
                title: '',
                widget: Center(
                  child: Text('Step 2'),
                ),
                isValid: true,
              ),
              HorizontalStep(
                title: '',
                widget: Center(
                  child: Text('Step 3'),
                ),
                isValid: true,
              ),
              HorizontalStep(
                title: '',
                widget: Center(
                  child: Text('Step 4'),
                ),
                isValid: true,
              ),
              HorizontalStep(
                title: '',
                widget: Center(
                  child: Text('Step 4'),
                ),
                isValid: true,
              ),
              HorizontalStep(
                title: '',
                widget: Center(
                  child: Text('Step 4'),
                ),
                isValid: true,
              )

            ],
            selectedColor: Colors.lightGreen,
            unSelectedColor: Colors.grey.shade400,
            leftBtnColor: Colors.lightBlue,
            rightBtnColor: Colors.lightGreen,
            selectedOuterCircleColor:Colors.lightBlue,
            type: Type.TOP,
            circleRadius: 30,
            onComplete: () {
              print('completed');
            },
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              decoration: null,
            )),
      ),

    );
  }
}

class StepperValidation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StepperValidationState();
}

class StepperValidationState extends State<StepperValidation> {
  bool isValidStep = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: HorizontalStepper(
            steps: [
              HorizontalStep(
                title: '',
                widget: Center(
                  child: InterestHobbies(),
                ),
                state: HorizontalStepState.SELECTED,
                isValid: true,
              ),
              HorizontalStep(
                title: '',
                widget: Center(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        isValidStep = true;
                      });
                    },
                    child: Text(
                      '',
                    ),
                  ),
                ),
                isValid: isValidStep,
              ),
              HorizontalStep(
                title: '',
                widget: Center(
                  child: Text('Step 3'),
                ),
                isValid: true,
              ),
              HorizontalStep(
                title: '',
                widget: Center(
                  child: Text('Step 4'),
                ),
                isValid: true,
              ),
              HorizontalStep(
                title: '',
                widget: Center(
                  child: Text('Step 4'),
                ),
                isValid: true,
              )
            ],
            selectedColor: Colors.lightGreen,
            unSelectedColor: Colors.grey.shade400,
            leftBtnColor: Colors.lightGreen,
            rightBtnColor: Colors.lightBlue,
            selectedOuterCircleColor: Colors.lightBlue,
            type: Type.TOP,
            circleRadius: 30,
            onComplete: () {
              print('completed');
            },
            textStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              decoration: null,
            )),
      ),
      appBar: AppBar(
        title: Text('Stepper State'),
      ),
    );
  }
}
