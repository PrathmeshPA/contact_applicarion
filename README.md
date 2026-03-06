<img width="1344" height="2992" alt="Screenshot_20260305_171456" src="https://github.com/user-attachments/assets/60f3d204-89ef-4fcd-af47-c30880e194e2" /># Flutter Contacts Application

## Project Overview

The Flutter Contacts Application is a mobile application developed using the Flutter framework that provides functionality similar to Google Contacts. The application allows users to efficiently manage their personal contacts through a clean and user-friendly interface.

The app supports adding, editing, deleting, viewing, Contact Profile and marking contacts as favorites. It also enables users to directly call a contact using the phone dialer. All contact data is stored locally using SQLite to ensure fast and offline access.

The application uses GetX for state management and navigation, ensuring a clean architecture and high performance.

---

# Objectives of the Application

The primary objective of this application is to demonstrate the following:

• Implementation of a responsive Material Design UI  
• Local data storage using SQLite  
• State management using GetX  
• Navigation using GetX routing  
• CRUD operations (Create, Read, Update, Delete)  
• Contact management functionality  
• Integration with device dialer for calling contacts  



---

# Key Features

## 1. Contact List

The application displays all saved contacts in a scrollable list view.

Each contact entry displays:
• Contact name  
• Contact phone number  
• Favorite status indicator  


Users can tap any contact to open the detailed profile screen.

---

## 2. Add Contact

Users can add a new contact using the Add Contact screen.

Input Fields:

• Name  
• Phone Number  
• Email Address  
• Address  
• Work info  



After clicking the Save button, the contact is stored in the SQLite database and appears in the contacts list.

---

## 3. Edit Contact

Users can update contact information if details change.

Editable fields include:

• Name  
• Phone number  
• Email address 
• Address  
• Work info

Example:

Original Contact

Name: Rahul Sharma  
Phone: 9988776655  

Updated Contact

Name: Rahul Sharma  
Phone: 9999999999  

The database is updated instantly.

---

## 4. Delete Contact

Users can remove a contact from the database.

To prevent accidental deletion, a confirmation dialog is shown.

Example Dialog:

Delete Contact

Are you sure you want to delete this contact?

[Cancel]   [Delete]

After confirmation, the contact is removed from the list.

---

## 5. Contact Details Screen

When a user taps a contact from the list, the app opens the Contact Details screen.

Displayed Information:

• Contact name  
• Phone number  
• Email address  
• Address  
• Work info



Available actions:

• Call contact  
• Delete contact  
• Mark or unmark favorite 


---

## 6. Call Contact

The application allows users to directly call a contact.

This feature is implemented using the url_launcher package.

Example:

If the phone number is:

9876543210

The application opens the dialer with:

tel:9876543210

This automatically opens the device dialer.

---

## 7. Favorite Contacts

Users can mark contacts as favorites.

Favorite contacts appear in the Favorites tab.


Favorites Tab :

Rahul Sharma ⭐  
Emma Watson ⭐  

This allows quick access to frequently contacted people.

---

# User Interface Design

The application follows Material Design principles to ensure a modern and consistent user experience.

UI components used include:

• AppBar  
• Floating Action Button  
• ListView  
• Bottom Navigation Bar  
• TextField  
• Elevated Button  
• Dialogs  

Example Layout Structure

Home Screen

AppBar: Contacts App

Body: Contact List

Floating Button: Add Contact

Bottom Navigation

Contacts | Favorites

---



---

# Technologies Used

Flutter

Used for building the cross-platform mobile application.

GetX

Used for state management, dependency injection, and navigation.

SQLite (sqflite)

Used for storing contact data locally on the device.

Path Provider

Used to locate the database storage path.

url_launcher

Used to open the phone dialer for calling contacts.

---



---

# Installation Guide

Follow the steps below to run the application locally.

Step 1: Install Flutter

Download Flutter from the official website:

https://flutter.dev

Verify installation:

flutter doctor

---

Step 2: Clone Repository

git clone https://github.com/PrathmeshPA/contact_applicarion

---

Step 3: Open Project

cd flutter_contacts_app

---

Step 4: Install Dependencies

flutter pub get

---

Step 5: Run Application

flutter run

Make sure you have:

• Android Studio installed  
• Emulator running OR physical device connected  

---

# Building APK

To generate an Android APK file:

flutter build apk

The generated APK file will be located at:

build/app/outputs/flutter-apk/app-release.apk

This APK can be installed directly on Android devices.

---

# Usage Instructions

Adding a Contact

1 Open the application  
2 Tap the "+" button  
3 Enter name, phone, and email  
4 Tap Save  

The contact will appear in the list.

---

Viewing Contact Details

1 Open Contacts tab  
2 Tap any contact  

The contact profile screen will open.

---

Marking Contact as Favorite

1 Tap the star icon beside the contact  
2 The contact will move to the Favorites tab  

---

Deleting a Contact

1 Open contact details  
2 Tap Delete button  
3 Confirm deletion  

---

Calling a Contact

1 Open contact details  
2 Tap Call button  

The phone dialer will open automatically.

---

# ScreenSho

<img width="250" height="450" alt="Screenshot_20260305_171405" src="https://github.com/user-attachments/assets/9aaa25dd-7f42-46fb-ad4e-cb1cf987ee19" />
<img width="250" height="450" alt="Screenshot_20260305_171420" src="https://github.com/user-attachments/assets/f3daa103-0ed6-489a-bf5b-e9c12c99e38f" />

<img width="250" height="450" alt="Screenshot_20260305_171514" src="https://github.com/user-attachments/assets/4ddeaab1-d788-4a0e-a427-79c946b9548d" />

<img width="250" height="450" alt="Screenshot_20260305_171530" src="https://github.com/user-attachments/assets/d8c1550f-d07b-474b-a536-4d73ee7a66fc" />

-62cd5614cbb6" /><img width="250" height="450" alt="Screenshot_20260305_171436" src="https://github.com/user-attachments/assets/f6d6f8f7-b1f8-4d67-8ee6-a2e0bf4fc716" />

ding Screenshot_20260305_171456.png…]()
4f88-8be0-9bd24e2cb2d0" />
<img width="250" height="450" alt="Screenshot_20260305_171456" src="https://github.com/user-attachments/assets/8bd09be1-ef07-4c0e-b2c3-542f1fa9745d" />

tes


---


# Testing

The application was tested for the following scenarios:

• Adding contacts  
• Editing contacts  
• Deleting contacts  
• Favorite functionality  
• Calling contacts  
• Navigation between screens  

All features were verified and tested successfully.
