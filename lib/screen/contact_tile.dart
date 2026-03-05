import 'package:flutter/material.dart';
import '../models/contect_model.dart';

class ContactTile extends StatelessWidget {

  final Contact contact;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  const ContactTile({
    super.key,
    required this.contact,
    required this.onTap,
    required this.onFavorite,
  });

  Color getAvatarColor(String name) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.red
    ];

    return colors[name.length % colors.length];
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),

      child: ListTile(

        leading: CircleAvatar(
          backgroundColor: getAvatarColor(contact.name),
          child: Text(
            contact.name[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        title: Text(
          contact.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),

        subtitle: Text(contact.phone),

        trailing: IconButton(
          icon: Icon(
            contact.favorite == 1
                ? Icons.star
                : Icons.star_border,
            color: Colors.orange,
          ),
          onPressed: onFavorite,
        ),

        onTap: onTap,
      ),
    );
  }
}