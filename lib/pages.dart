import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_auto_route/app_router.gr.dart';

class Data {
  final String id;
  final String name;

  Data(this.id) : name = "Named $id";

  static final List<Data> all = List.generate(100, (i) => Data(i.toString()));
}

typedef LoginCallback = void Function();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.onLogin}) : super(key: key);
  final LoginCallback onLogin;

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: emailController,
                textAlign: TextAlign.center,
              ),
              TextFormField(
                controller: passwordController,
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  if (emailController.text == passwordController.text) {
                    AutoRouter.of(context).popForced();
                    widget.onLogin();
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ));
}

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("List"),
        ),
        body: ListView.separated(
          itemCount: Data.all.length,
          itemBuilder: (context, index) => GestureDetector(
              child: DataView(data: Data.all[index]),
              onTap: () => AutoRouter.of(context)
                  .push(DetailsRoute(detailsId: Data.all[index].id))),
          separatorBuilder: (context, index) => const Divider(),
        ),
      );
}

class DataView extends StatefulWidget {
  const DataView({Key? key, required this.data}) : super(key: key);

  final Data data;

  @override
  DataViewState createState() => DataViewState();
}

class DataViewState extends State<DataView> {
  @override
  Widget build(BuildContext context) => Text(widget.data.name);
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, @PathParam('id') required this.detailsId})
      : super(key: key);

  final String detailsId;

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
        ),
        body: DataView(
            data: Data.all
                .singleWhere((element) => element.id == widget.detailsId)),
      );
}
