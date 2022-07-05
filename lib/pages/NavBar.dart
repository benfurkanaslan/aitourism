import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('accountName'),
            accountEmail: Text('accountEmail'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://cdn.dribbble.com/users/485347/screenshots/2983299/8_most_influential_people_dribble-01.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                    'https://img-s2.onedio.com/id-566c21f4e95dbb0447750cf4/rev-0/w-620/f-jpg/s-0906ea622cb855eaf5dfe2e8c097fb8ea8a59f1d.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Teklifler'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '7',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Mesajlar'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.local_police),
            title: Text('Acil Buton'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ayarlar'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Çıkış'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
