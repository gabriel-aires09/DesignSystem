import 'package:Design_System/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:Design_System/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:Design_System/DesignSystem/Components/InputField/input_text.dart';
import 'package:Design_System/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:Design_System/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:Design_System/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/148x148.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 64),
              StyledInputField.instantiate(
                viewModel: InputTextViewModel(
                  controller: emailController,
                  placeholder: 'E-mail',
                  password: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Letters only are allowed!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              StyledInputField.instantiate(
                viewModel: InputTextViewModel(
                  controller: passwordController,
                  placeholder: 'Password',
                  password: true,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              StyledInputField.instantiate(
                viewModel: InputTextViewModel(
                  controller: confirmPasswordController,
                  placeholder: 'Confirm Password',
                  password: false,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (value != passwordController.text) {
                      return 'The passwords do not match';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24),
              ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  style: ActionButtonStyle.primary,
                  size: ActionButtonSize.large,
                  text: 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle sign up logic here
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: acceptedTerms,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      checkColor: Colors.amber,
                      onChanged: (value) {
                        setState(() {
                          acceptedTerms = value!;
                        });
                      }),
                  LinkedLabel.instantiate(
                    viewModel: LinkedLabelViewModel(
                        fullText: 'I have read and agree Terms & Services',
                        linkedText: 'Terms & Services',
                        onLinkTap: () {
                          if (kDebugMode) {
                            print('Tudo liberado!');
                          }
                        }),
                  ),
                ],
              ),
              const SizedBox(height: 96),
              const Text(
                'Already Have An Account?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 73,
                child: ActionButton.instantiate(
                  viewModel: ActionButtonViewModel(
                    style: ActionButtonStyle.primary,
                    size: ActionButtonSize.small,
                    text: 'Login',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
