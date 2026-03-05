import 'package:get/get.dart';
import '../database/db.dart';
import '../models/contect_model.dart';

class ContactController extends GetxController {

  DBHelper db = DBHelper();

  var contacts = <Contact>[].obs;
  var filteredContacts = <Contact>[].obs;

  var favorites = <Contact>[].obs;
  var filteredFavorites = <Contact>[].obs;

  @override
  void onInit() {
    loadContacts();
    super.onInit();
  }

  void loadContacts() async {

    final data = await db.getContacts();

    contacts.assignAll(data);
    filteredContacts.assignAll(data);

    final fav = data.where((c) => c.favorite == 1).toList();

    favorites.assignAll(fav);
    filteredFavorites.assignAll(fav);
  }

  void searchContacts(String query) {

    if (query.trim().isEmpty) {

      filteredContacts.assignAll(contacts);
      filteredFavorites.assignAll(favorites);

    } else {

      final search = query.toLowerCase();

      filteredContacts.assignAll(
        contacts.where((contact) =>
            contact.name.toLowerCase().contains(search)).toList(),
      );

      filteredFavorites.assignAll(
        favorites.where((contact) =>
            contact.name.toLowerCase().contains(search)).toList(),
      );
    }
  }

  void addContact(Contact contact) async {
    await db.insert(contact);
    loadContacts();
  }

  void updateContact(Contact contact) async {
    await db.update(contact);
    loadContacts();
  }

  void deleteContact(int id) async {
    await db.delete(id);
    loadContacts();
  }

  void toggleFavorite(Contact contact) async {

    contact.favorite = contact.favorite == 1 ? 0 : 1;

    await db.update(contact);

    loadContacts();
  }
}