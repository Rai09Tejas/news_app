import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quantum_task/providers/auth_provider.dart';
import 'package:quantum_task/utils/assets.dart';
import 'package:quantum_task/utils/colors.dart';
import 'package:quantum_task/utils/constants.dart';
import 'package:quantum_task/utils/models/userModel.dart';
import 'package:quantum_task/widgets/custom_home_app_bar.dart';

class LoginScreen extends StatefulWidget {
  static const String tag = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  static bool isLogin = true;
  static bool isLoading = false;
  static bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (_, authProvider, __) {
        return Scaffold(
          backgroundColor: AppColors.lightGrey,
          appBar: const CustomHomeAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
              children: [
                toggleButton(),
                heightBox(getDeviceHeight(context) * 0.01),
                isLogin ? loginForm() : signupForm(),
                heightBox(getDeviceHeight(context) * 0.01),
                nextButton()
              ],
            )),
          ),
        );
      },
    );
  }

  toggleButton() {
    double height = getDeviceHeight(context) * 0.06;
    double width = getDeviceWidth(context) * 0.48;
    Radius borderRad = const Radius.circular(30.0);

    return Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.light,
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.only(
            bottomLeft: borderRad,
            bottomRight: borderRad,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLogin = true;
                });
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(width, height),
                backgroundColor: isLogin ? Colors.red : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: borderRad, bottomRight: borderRad),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: isLogin ? AppColors.light : AppColors.gray50,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLogin = false;
                });
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(width, height),
                backgroundColor: isLogin ? Colors.white : Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: borderRad, bottomRight: borderRad),
                ),
              ),
              child: Text(
                'Signup',
                style: TextStyle(
                  color: isLogin ? AppColors.gray50 : Colors.white,
                ),
              ),
            ),
          ],
        ));
  }

  loginForm() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: getDeviceWidth(context),
      height: getDeviceHeight(context) * 0.7,
      decoration: const BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("SignIn into your \n Account"),
          const Text("Email"),
          TextFormField(
              controller: emailController,
              validator: (input) =>
                  !input!.contains('@') ? 'Please enter a valid email' : null,
              decoration: const InputDecoration(
                  hintText: "johndoe@gmail.com",
                  suffixIcon: Icon(
                    Icons.email,
                    color: Colors.red,
                  ))),
          const Text("Password"),
          TextFormField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: "*",
              validator: (input) => input!.trim().isEmpty
                  ? 'Please enter a valid username'
                  : null,
              decoration: const InputDecoration(
                  hintText: "********",
                  suffixIcon: Icon(
                    Icons.lock_outlined,
                    color: Colors.red,
                  ))),
          const Text("Forgot Password?"),
          const Text("Login with"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(googleIcon), Image.asset(fbIcon)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an Account?"),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isLogin = false;
                    });
                  },
                  child: const Text("Register Now"))
            ],
          )
        ],
      ),
    );
  }

  signupForm() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: getDeviceWidth(context),
      height: getDeviceHeight(context) * 0.7,
      decoration: const BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create an \n Account"),
            const Text("Name"),
            TextFormField(
                controller: nameController,
                validator: (input) => input!.trim().isEmpty
                    ? 'Please enter a valid username'
                    : null,
                decoration: const InputDecoration(
                    hintText: "John Doe",
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.red,
                    ))),
            heightBox(
              getDeviceHeight(context) * 0.01,
            ),
            const Text("Email"),
            TextFormField(
                controller: emailController,
                validator: (input) =>
                    !input!.contains('@') ? 'Please enter a valid email' : null,
                decoration: const InputDecoration(
                    hintText: "johndoe@gmail.com",
                    suffixIcon: Icon(
                      Icons.email,
                      color: Colors.red,
                    ))),
            heightBox(
              getDeviceHeight(context) * 0.01,
            ),
            const Text("Contact no"),
            TextFormField(
                maxLength: 10,
                controller: contactController,
                validator: (input) => input!.trim().isEmpty
                    ? 'Please enter a valid username'
                    : null,
                decoration: const InputDecoration(
                    hintText: "9876543210",
                    suffixIcon: Icon(
                      Icons.lock_outlined,
                      color: Colors.red,
                    ))),
            heightBox(
              getDeviceHeight(context) * 0.01,
            ),
            const Text("Password"),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                validator: (input) => input!.trim().isEmpty
                    ? 'Please enter a valid username'
                    : null,
                decoration: const InputDecoration(
                    hintText: "********",
                    suffixIcon: Icon(
                      Icons.lock_outlined,
                      color: Colors.red,
                    ))),
            heightBox(
              getDeviceHeight(context) * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: checkbox,
                    onChanged: (bool? val) {
                      setState(() {
                        checkbox = val!;
                      });
                    }),
                const Text("I agree with "),
                const Text("term & condition"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isLogin = true;
                      });
                    },
                    child: const Text("Sign In!"))
              ],
            )
          ],
        ),
      ),
    );
  }

  nextButton() {
    return InkWell(
      onTap: () {
        UserModel userModel = UserModel(
          uid: "",
          email: emailController.text,
          name: nameController.text,
          contact: contactController.text,
          password: passwordController.text,
        );
        if (isLogin) {
          AuthProvider().logInUser(context, userModel);
        } else if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          AuthProvider().signUp(context, userModel);
        }
      },
      child: Container(
        width: getDeviceWidth(context),
        height: getDeviceHeight(context) * 0.1,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Center(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    isLogin ? "Login" : "Register",
                    style: const TextStyle(
                      color: AppColors.light,
                      fontSize: 20,
                    ),
                  )),
      ),
    );
  }
}
