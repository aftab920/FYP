import 'package:flutter/material.dart';

class UserProfileEdit extends StatelessWidget {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
          ),
        ],
      ),
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 40,
              ),
              child: CircleAvatar(
                radius: 50.0,
                //backgroundImage: ,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/Profile_Image.jpg',
                    fit: BoxFit.cover,
                  ),
                  //borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              'Admin',
              style: Theme.of(context).textTheme.button!.copyWith(fontSize: 25),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // bottom: MediaQuery.of(context).viewInsets.bottom + 5,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        label: Text('Update Name'),
                      ),
                      //initialValue: AdminApiCalling.email,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        label: Text('Update Email'),
                      ),
                      //initialValue: AdminApiCalling.email,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        label: Text('Update Password'),
                      ),
                      //initialValue: AdminApiCalling.email,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
