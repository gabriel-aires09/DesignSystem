import 'package:Design_System/DesignSystem/design_system.dart';
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
  final TextEditingController confirmPasswordController = TextEditingController();
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
              _buildImage(assetPath: 'assets/148x148.png'),
              
              verticalSpaceLarge,
              _buildEmailInput(
                  emailController: emailController,
                  placeholder: 'Email',
                  isPassword: false
              ),
              
              verticalSpaceSmall,
              _buildPasswordInput(
                controller: passwordController,
                placeholder: 'Password',
                isPassword: true,
                suffixIcon: const Icon(Icons.remove_red_eye)
              ),
              
              verticalSpaceSmall,
              _buildConfirmPasswordInput(
                controller: confirmPasswordController, 
                placeholder: 'Confirm Password', 
                isPassword: true, 
                suffixIcon: const Icon(Icons.remove_red_eye)
              ),

              verticalSpaceRegular,
              _buildSignUpButton(
                context: context, 
                text: 'Sign Up'
              ),

              verticalSpaceSmall,
              _buildCheckboxWithLabel(),
              
              verticalSpaceExtraLarge,
              _buildCenteredLoginSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage({required String assetPath}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildEmailInput({
    required TextEditingController emailController,
    required String placeholder,
    required bool isPassword,
  }) {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
          controller: emailController,
          placeholder: placeholder,
          password: false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
              return 'Letters only are allowed!';
            }
            return null;
          }),
    );
  }

  Widget _buildPasswordInput({
    required TextEditingController controller,
    required String placeholder,
    required bool isPassword,
    Widget? suffixIcon,
  }) {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
          controller: controller,
          placeholder: placeholder,
          password: isPassword,
          suffixIcon: suffixIcon,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
              return null;
            },
      ),
    );
  }

  Widget _buildConfirmPasswordInput({
    required TextEditingController controller,
    required String placeholder,
    required bool isPassword,
    Widget? suffixIcon
  }) {
    return StyledInputField.instantiate(
      viewModel: InputTextViewModel(
        controller: controller,
        placeholder: placeholder,
        password: isPassword,
        suffixIcon: suffixIcon,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          } else if (value != controller.text) {
            return 'The passwords do not match';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildSignUpButton({
    required BuildContext context,
    required String text,
    ActionButtonSize size = ActionButtonSize.large,
  }) {
    return ActionButton.instantiate(
      viewModel: ActionButtonViewModel(
        style: ActionButtonStyle.primary,
        size: size,
        text: text,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Handle sign up logic here
            Navigator.pushReplacementNamed(context, '/');
          }
        },
      ),
    );
  }

  Widget _buildCheckboxWithLabel() {
    return Row(
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
          },
        ),
        LinkedLabel.instantiate(
          viewModel: LinkedLabelViewModel(
            fullText: 'I have read and agree Terms & Services',
            linkedText: 'Terms & Services',
            onLinkTap: () {
              if (kDebugMode) {
                print('Tudo liberado!');
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCenteredLoginSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already Have An Account?',
          style: TextStyle(
            fontSize: 16,
            color: blackTextColor,
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
              text: 'Login',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ),
        ),
      ],
    );
  }
}
