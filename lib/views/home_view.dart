import 'package:flutter/material.dart';
import 'package:homework_users/domain/provider/users_provider.dart';
import 'package:homework_users/router/app_routes.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Users Info",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 28),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => PersonList(
                  indexx: index,
                  photoName: model.userPhotos[index],
                  name: model.users[index]["name"].toString(),
                  userName: model.users[index]["username"].toString(),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
            itemCount: model.users.length));
  }
}

class PersonList extends StatelessWidget {
  final int indexx;
  final String name;
  final String userName;
  final String photoName;
  const PersonList({
    super.key,
    required this.indexx,
    required this.name,
    required this.userName,
    required this.photoName,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);
    return GestureDetector(
      onTap: () {
        model.currentIndex = indexx;
        Navigator.of(context).pushNamed(AppRoutes.info);
      },
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          userName,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage("images/$photoName"),
        ),
      ),
    );
  }
}
