import 'package:Design_System/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:Design_System/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:Design_System/DesignSystem/Components/InputField/input_text.dart';
import 'package:Design_System/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:Design_System/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:Design_System/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:Design_System/DesignSystem/shared/ui_helper.dart';
import 'package:Design_System/Views/Profile/profile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              verticalSpaceLarge,
              StyledInputField.instantiate(
                viewModel: InputTextViewModel(
                  controller: emailController,
                  placeholder: 'E-mail',
                  password: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Esse campo é obrigatório';
                    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Somente letras são permitidas!';
                    }
                    return null;
                  },
                ),
              ),
              verticalSpaceSmall,
              StyledInputField.instantiate(
                viewModel: InputTextViewModel(
                  controller: passwordController,
                  placeholder: 'Password',
                  password: true,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Esse campo é obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              verticalSpaceRegular,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LinkedLabel.instantiate(
                    viewModel: LinkedLabelViewModel(
                      fullText: 'Forgot Password',
                      linkedText: 'Forgot Password',
                      onLinkTap: () {
                        print('Esqueceu a senha?');
                      },
                    ),
                  ),
                ],
              ),
              verticalSpaceRegular,
              ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  style: ActionButtonStyle.primary,
                  size: ActionButtonSize.large,
                  text: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    }
                  },
                ),
              ),
              verticalSpaceExtraLarge,
              const Text(
                'Don\'t Have An Account?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpaceRegular,
              SizedBox(
                width: 73,
                child: ActionButton.instantiate(
                  viewModel: ActionButtonViewModel(
                    style: ActionButtonStyle.primary,
                    size: ActionButtonSize.small,
                    text: 'Sign Up',
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
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