import 'package:flutter/material.dart';
import 'package:rest_api_practice/models/users.dart';
import 'package:rest_api_practice/services/remote_service.dart';

class OtherUsers extends StatefulWidget {
  const OtherUsers({Key? key}) : super(key: key);

  @override
  State<OtherUsers> createState() => _OtherUsersState();
}

class _OtherUsersState extends State<OtherUsers> {
  List<Users>? users;
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    users = await RemoteService().getUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Users'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: users?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipOval(
                                child: Image.network(
                                    'https://via.placeholder.com/150'),
                              ))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),

                        Text(
                          'Name: ${users![index].name}',
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'username: ${users![index].username}',
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'email: ${users![index].email}',
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'phone: ${users![index].phone}',
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'website: https//${users![index].website}',
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(height: 10,),
                        const Text('Works at'),
                        Text(
                          'Company name: ${users![index].company.name}',
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(height: 10,),
                        // Text(
                        //     'Company catchPhrase: ${users![index].company.catchPhrase}',maxLines: 3,
                        //       overflow: TextOverflow.ellipsis,),
                        // Text('Company bs: ${users![index].company.bs}',maxLines: 3,
                        //       overflow: TextOverflow.ellipsis,),
                        const Text(
                          'Address: ',
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'street: ${users![index].address.street}',
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'city: ${users![index].address.city}',
                          style: const TextStyle(fontSize: 17),
                        ),
                        //Text('suite: ${users![index].address.suite}'),
                        // Text('zipcode: ${users![index].address.zipcode}'),
                        // const Text('Geo: '),
                        // Text('lat: ${users![index].address.geo.lat}'),
                        // Text('lng: ${users![index].address.geo.lng}'),
                      ],
                    ),
                  ],
                ),
              );
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
