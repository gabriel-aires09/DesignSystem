import 'package:Design_System/DesignSystem/design_system.dart';
import 'package:flutter/foundation.dart';
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
              _buildLogo('assets/148x148.png'),
              _buildInputField(
                controller: emailController,
                placeholder: 'E-mail',
                isPassword: false,
              ),
              verticalSpaceSmall,
              _buildInputField(
                  controller: passwordController,
                  placeholder: 'Password',
                  isPassword: true,
                  suffixIcon: const Icon(Icons.remove_red_eye)),
              verticalSpaceRegular,
              _buildLinkedLabel(
                  fullText: 'Forgot Password', linkedText: 'Forgot Password'),
              verticalSpaceRegular,
              _buildLoginButton(
                context: context,
                text: 'Login',
              ),
              verticalSpaceExtraLarge,
              _buildText(
                  text: 'Don\'t Have An Account?',
                  fontSize: 16,
                  color: darkPrimaryBaseColorLight,
                  fontWeight: FontWeight.w600),
              verticalSpaceRegular,
              _buildSignUpButton(
                context: context,
                text: 'Sign Up',
                width: 73,
                size: ActionButtonSize.small,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(String assetPath) {
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

  Widget _buildInputField({
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
            return 'Esse campo é obrigatório';
          } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
            return 'Somente letras são permitidas!';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildLinkedLabel(
      {required String fullText, required String linkedText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LinkedLabel.instantiate(
          viewModel: LinkedLabelViewModel(
            fullText: fullText,
            linkedText: linkedText,
            onLinkTap: () {
              if (kDebugMode) {
                print('Esqueceu a senha?');
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton({
    required BuildContext context,
    required String text,
    double? width,
    ActionButtonSize size = ActionButtonSize.large,
  }) {
    return SizedBox(
      width: width,
      child: ActionButton.instantiate(
        viewModel: ActionButtonViewModel(
          style: ActionButtonStyle.primary,
          size: size,
          text: text,
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
    );
  }

  Widget _buildSignUpButton({
    required BuildContext context,
    required String text,
    required double? width,
    ActionButtonSize size = ActionButtonSize.large,
  }) {
    return SizedBox(
      width: width,
      child: ActionButton.instantiate(
        viewModel: ActionButtonViewModel(
          style: ActionButtonStyle.primary,
          size: size,
          text: text,
          width: width,
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
        ),
      ),
    );
  }

  Widget _buildText({
    required String text,
    required double fontSize,
    required Color color,
    required FontWeight fontWeight,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
