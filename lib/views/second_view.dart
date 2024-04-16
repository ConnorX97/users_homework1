import 'package:flutter/material.dart';
import 'package:homework_users/domain/provider/users_provider.dart';
import 'package:homework_users/views/info_view.dart';
import 'package:provider/provider.dart';

class SeconView extends StatelessWidget {
  const SeconView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserProvider>(context);
    int currentIndex = model.currentIndex;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: Colors.white,
            expandedHeight: 334,
            backgroundColor: Colors.blueGrey,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: Text(
                model.users[currentIndex]["name"],
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              expandedTitleScale: 1.8,
              centerTitle: false,
              background: Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  "images/${model.userPhotos[currentIndex]}",
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Infos(
                        title: model.users[currentIndex]["username"],
                        subtitle: "Username",
                        icon: Icons.person),
                    Divider(),
                    Infos(
                      title: model.users[currentIndex]["phone"],
                      subtitle: "Mobile",
                      icon: Icons.phone,
                    ),
                    Divider(),
                    Infos(
                      title: model.users[currentIndex]["email"],
                      icon: Icons.mail,
                      subtitle: "Mail",
                    ),
                    Divider(),
                    Infos(
                      title: model.users[currentIndex]["website"],
                      icon: Icons.language,
                      subtitle: "Website",
                    ),
                    Divider(),
                    Infos(
                        title: model.users[currentIndex]["address"]["city"],
                        subtitle: "City",
                        icon: Icons.location_on),
                    Divider(),
                    Infos(
                      title:
                          "${model.users[currentIndex]["address"]['street']} , ${model.users[currentIndex]["address"]["suite"]}",
                      icon: Icons.map,
                      subtitle: "Adress",
                    ),
                    Divider(),
                    Infos(
                      title: model.users[currentIndex]["company"]["name"],
                      icon: Icons.work,
                      subtitle: "Company",
                    ),
                    Divider(),
                    Infos(
                        title:
                            " \"${model.users[currentIndex]["company"]["catchPhrase"]}\"",
                        subtitle: "CatchPhrase",
                        icon: Icons.record_voice_over),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
