import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homework_users/domain/consts.dart';
import 'package:homework_users/domain/provider/users_provider.dart';
import 'package:provider/provider.dart';

class FullInfo extends StatelessWidget {
  final int index;
  const FullInfo({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);
    return Container(
      width: double.infinity,
      height: 620,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 140,
                color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 32,
                          color: Colors.white,
                        )),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        model.users[index]["name"],
                        style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xFFe6f0fa),
                width: double.infinity,
                height: 464,
                child: Column(
                  children: [
                    Infos(
                      title: model.users[index]["phone"],
                      subtitle: "Mobile",
                      icon: Icons.phone,
                    ),
                    Divider(),
                    Infos(
                      title: model.users[index]["email"],
                      icon: Icons.mail,
                      subtitle: "Mail",
                    ),
                    Divider(),
                    Infos(
                      title: model.users[index]["website"],
                      icon: Icons.language,
                      subtitle: "Website",
                    ),
                    Divider(),
                    Infos(
                      title:
                          "${model.users[index]["address"]['city']} , ${model.users[index]["address"]["suite"]}",
                      icon: Icons.map,
                      subtitle: "Adress",
                    ),
                    Divider(),
                    Infos(
                      title: model.users[index]["company"]["name"],
                      icon: Icons.work,
                      subtitle: "Company",
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Infos extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const Infos(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.all(18.0),
        child: Icon(
          icon,
          color: Colors.blueGrey,
          size: 32,
        ),
      ),
      title: Text(
        title,
        style: infoTextStyle,
      ),
      subtitle: Text(
        subtitle,
        style: subtitleTextStyle,
      ),
    );
  }
}
