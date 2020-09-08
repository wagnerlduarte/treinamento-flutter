import 'package:contacts_service/contacts_service.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts;

  @override
  void initState() {
    super.initState();

    refreshContacts();
  }

  refreshContacts() async {
    List<Contact> contacts = await ContactsService.getContacts(
        withThumbnails: false, iOSLocalizedLabels: false);

    setState(() {
      _contacts = contacts;
    });
  }

  share(Contact contact) {
    Share.text('Contatos', '${contact.phones.first.value}', 'text/plan');
  }

  @override
  Widget build(BuildContext context) {
    return _contacts == null
        ? Center(child: CircularProgressIndicator(),)
        : ListView.builder(itemCount: _contacts?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          Contact contact = _contacts?.elementAt(index);
          return ListTile(title: Text(contact.displayName),
            onTap: () => share(contact),
            leading: CircleAvatar(child: Text(contact.initials(),),),);
        });
  }
}
