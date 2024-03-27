import 'package:flutter/material.dart';
import 'package:my_app/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  late int counter;
  late bool isDartTheme;

  @override
  void initState() {
    super.initState();
    counter = 0;
    isDartTheme = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/img/videologo.png'),
              ),
              accountName: const Text('Aristides Matoca'),
              accountEmail: const Text('aristides@gmail.ocm')),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            subtitle: const Text('Tela de inicio'),
            onTap: () {
              print('Home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Logout'),
            subtitle: const Text('Finalizar sessao'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ]),
      ),
      appBar: AppBar(
        title: const Text('Home Page do Aristides'),
        actions: [CustomSwitcher()],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Contador $counter'),
          Container(height: 10),
          CustomSwitcher(),
          Container(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
            ],
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter++;
            });
          }),
    );
  }
}

class CustomSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDartTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
